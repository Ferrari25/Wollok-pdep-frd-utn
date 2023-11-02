class Arbol {
	var vejez = 0
	var tamanoTronco = 0
	var elementos = []

	method capacidad() = vejez * tamanoTronco
	method capacidadDisponible() = self.capacidad() - elementos.sum({e=>e.lugarQueOcupa()})

	method agregarElemento(elem) {
		if (elem.lugarQueOcupa() <= self.capacidadDisponible()) {
			elementos.add(elem)
		} else {
			const m = "No se pudo agregar el elemento al arbol (capacidad excedida)"
			throw new Exception(message=m)
		}
	}

	method agregarDestinatario(dest) {
		elementos.forEach({e=>e.agregarDestinatario(dest)})
	}

	method importancia() = elementos.sum({e=>e.importancia()})

	method promedioDeImportancia() = self.importancia() / elementos.size()

	method cuantasCosasImportantes() = elementos.filter({e=>e.importancia() > self.promedioDeImportancia()}).size()

	method eliminarElementosVoluminosos() {
		elementos = elementos.filter({e=>e.lugarQueOcupa() <= 5})
	}

	method destinatarios() {
		var dest = []
		elementos.forEach({e=>dest.addAll(e.destinatarios())}) 
		var count = dest.asSet().map({e => [e, dest.count({d=>d==e})]})
		count = count.asList()
		count.sortBy({a,b => a.get(1) > b.get(1) })
		return count.map({e=>e.get(0)})
		
	}

}

class Regalo {
	const destinatarios = []
	method importancia() = 2 * destinatarios
	method lugarQueOcupa() = 1
	method agregarDestinatario(dest) {
		destinatarios.add(dest)
	}
	method destinatarios() = destinatarios
}

class Tarjeta {
	var destinatario
	var property importancia

	method lugarQueOcupa() = 0
	method agregarDestinatario(dest) {
		destinatario = dest
	}
	method destinatarios() = [destinatario]
}

class Adorno {
	var peso = 0
	var coefSuperioridad = 0

	method imortancia() = peso * coefSuperioridad
	method lugarQueOcupa() = 3.min(peso)
	method agregarDestinatario(dest) {} 
	method destinatarios() = []
}

class FiguraElaborada {
	var adornos = []
	method adornoMasImportante() = adornos.max({a => a.importancia()})
	method importancia() = self.adornoMasImportante().importancia()
	method lugarQueOcupa() = adornos.sum({a=>a.lugarQueOcupa()}) + 1
	method agregarDestinatario(dest) {} 
	method destinatarios() = []
}

class Estrella {
	var property destinatarios = casa.habitantes()

	method importancia() = 10
	method lugarQueOcupa() = 1
	method agregarDestinatario(dest) {
		destinatarios.add(dest)
	}
}

object casa {
	const property habitantes = ["Juan", "Carlos", "Pedro", "María", "Valentina"]
}
