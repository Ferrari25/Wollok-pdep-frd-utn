// Mensajeros de pelicula, primera parte
import TP7_Mensajeria.*
object roberto
{
	const property peso = 90
	var transporte = camion

	method peso() {return peso + transporte.peso()}

	method transporte(vehiculo) {transporte = vehiculo}

	method tieneCredito() {return false}
}

object neo 
{
	const property peso = 1
	var property credito = 0
	var tieneCelular = true
	
	method peso() {return peso} 
	method cargarCredito(carga) {credito = credito + carga}
	method puedeLlamar()= credito > 0 && tieneCelular
}

object chuck
{
	const property peso = 900
	var property pulgarEnOido = false
	const property meniqueEnBoca = false
	
	method peso(){return peso}
	method pulgarEnOidoo(){if (pulgarEnOido == false) {pulgarEnOido = true} else {pulgarEnOido = false} }
	method meniqueEnBocaa(){if (pulgarEnOido == false) {pulgarEnOido = true} else {pulgarEnOido = false} }
	method puedeLLamar()= pulgarEnOido && meniqueEnBoca
}

object camion 
{
	var acoplados = 2
	method peso() {return acoplados * 500}
	method acoplados(cantAcoplados) {acoplados = cantAcoplados}
}

object bicicleta
{

	method peso() {return 1}
}

object brooklyn 
{
	method dejarPasar(mensajero) {return mensajero.peso() < 1000}
}


object matrix
{
	method dejarPasar(mensajero) = mensajero.puedeLlamar()
}

object paquete 
{
	var pago = false
	var destino = brooklyn
	
	method pagar() {pago = true}
	method estaPago() {return pago}
	method destino(lugar) {destino = lugar}
	method puedeSerEntregadoPor(mensajero) {
		return destino.dejarPasar(mensajero) and self.estaPago()
	} 
}

object paquetito
{
	var pago = true
	var destino = brooklyn
	method estaPago() {return pago}
	method destino(lugar) {destino = lugar}

	method puedeSerEntregadoPor(mensajero) = true

}
																					
object paqueton
{	
  const destinos = new List()
  const property precioBase = 100
  var  pagado = 0
  
  method initDestinos(){destinos.add(matrix) destinos.add(brooklyn)}
  
  method abonado() = return pagado
  method precio()= destinos.size() * precioBase
  method pagar(dinero){pagado =  pagado + dinero}
  method estaPago()= pagado == self.precio()
}			