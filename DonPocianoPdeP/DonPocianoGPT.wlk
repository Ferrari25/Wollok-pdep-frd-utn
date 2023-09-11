object Cultivo {
  method costoSemillaPorHectarea() = 0
  method rendimientoInicial() = 0
  method precioVentaPorQuintal() = 0
  method calcularPrecioVenta(totalQuintales) = totalQuintales * precioVentaPorQuintal()
}

object Trigo is Cultivo {
  var costoSemillaPorHectarea = 500
  var rendimientoInicial = 10
  var precioVentaPorQuintal = 1000

  method rendimientoConFertilizante(rendimientoBase) = rendimientoBase + 2
}

object Soja is Cultivo {
  method costoSemillaPorHectarea() = Cultivo.precioVentaPorQuintal() / 2
  var rendimientoInicial = 20
  var precioVentaPorQuintal = obtenerPrecioSoja() * (1 - 0.35)

  method rendimientoConFertilizante(rendimientoBase) = if (estaFertilizado) rendimientoBase else rendimientoBase * 2

  private method obtenerPrecioSoja() =  // Obtener el precio de la soja del mercado
  private var estaFertilizado = false
}

object Maiz is Cultivo {
  var costoSemillaPorHectarea = 500
  var rendimientoInicial = 15
  var precioVentaPorQuintal = Soja.precioVentaPorQuintal() / 2

  method costoSemillaPorHectarea() = if (campo.tamaño > 12) 5000 else costoSemillaPorHectarea
}

object Campo {
  var tamaño = 15
  var hectareasSembradas = 10
  var cultivoSembrado = Trigo
  var dineroBanco = 5000

  method fumigar() {
    dineroBanco -= tamaño * 10
  }

  method aplicarFertilizante() {
    dineroBanco -= hectareasSembradas * cultivoSembrado.costoFertilizantePorHectarea()
    hectareasSembradas = cultivoSembrado.rendimientoConFertilizante(hectareasSembradas)
  }

  method resiembra(nuevoCultivo) {
    cultivoSembrado = nuevoCultivo
  }

  method ampliarSiPosible() {
    var espacioDisponible = tamaño - hectareasSembradas
    if (espacioDisponible > 0) {
      var hectareasAmpliar = min(espacioDisponible, cultivoSembrado.hectareasAExpandir())
      hectareasSembradas += hectareasAmpliar
      dineroBanco -= hectareasAmpliar * cultivoSembrado.costoSemillaPorHectarea()
    }
  }

  method cosechaYVenta() {
    var totalQuintales = hectareasSembradas * cultivoSembrado.rendimientoActual()
    var dineroVenta = cultivoSembrado.calcularPrecioVenta(totalQuintales)
    dineroBanco += dineroVenta
    hectareasSembradas = 0
  }
}

// Pruebas
object Test {
  import Campo.*
  
  method run() {
    fumigar()
    print(dineroBanco)  // Debe mostrar: 4250 (5000 - 15 * 10)

    aplicarFertilizante()
    print(hectareasSembradas)  // Debe mostrar: 12 (10 + 2)
    
    resiembra(Soja)
    print(cultivoSembrado)  // Debe mostrar: Soja
    
    ampliarSiPosible()
    print(hectareasSembradas)  // Debe mostrar: 12 (no hay espacio)
    
    ampliarSiPosible()
    print(hectareasSembradas)  // Debe mostrar: 14 (se amplían 2)
    
    cosechaYVenta()
    print(dineroBanco)  // Depende del precio de la Soja y del rendimiento
  }
}

Test.run()
