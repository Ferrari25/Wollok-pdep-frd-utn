class Alumno {
	var property nivelDeAtencion = 20
	var property motivado = false
	var property estadoDeAnimo = masomenos
	// const temasAprendidos = new Set()
	// const temasEnsenados = new Set()
	const temasAprendidos = []
	const temasEnsenados = []

	method aumentarNivelDeAtencion(cantidad) {
		nivelDeAtencion = 100.min(nivelDeAtencion + cantidad)
	}

	method duplicarNivelDeAtencion() {
		nivelDeAtencion = 100.min(nivelDeAtencion * 2)
	}

	method empeorarEstadoDeAnimo() {
		estadoDeAnimo = estadoDeAnimo.anterior()
	}

	method mejorarEstadoDeAnimo() {
		estadoDeAnimo = estadoDeAnimo.siguiente()
	}

	method seQuiereIrOMasOMenos() = estadoDeAnimo == meQuieroIr || estadoDeAnimo == masomenos

	method aprender(tema) {
		// Asumo que el alumno tiene que poder aprender el tema para aprenderlo, independientemente
		// de si se lo intentan de ensenar mas de una vez, porque la consigna dice que tienen que
		// estar dadas las condiciones.
		if (tema.puedeAprender(self)) {
			temasAprendidos.add(tema)
			self.aumentarNivelDeAtencion(tema.aumentoDeAtencion())
			motivado = true
			self.mejorarEstadoDeAnimo()
		} 
		temasEnsenados.add(tema)
	}
	
	method noAprendioTemaImprescindible() = temasEnsenados.any({tema => tema.imprescindible() && !temasAprendidos.contains(tema)})

	method calificacion() {
		// Asumo calificaciones sin decimales
		const proporcion = (10 * temasAprendidos.size() / temasEnsenados.size()).round()
		if (proporcion <= 3 && self.noAprendioTemaImprescindible()) {
			return 2
		} else {
			return proporcion
		}
	}

	// Asumo que se aprueba con 4
	method aprobado() = self.calificacion() > 4

	method aprendioTema(tema) = temasAprendidos.contains(tema)
}

// Estados de animo
object meQuieroIr {
	method anterior()= self
	method siguiente() = masomenos
}

object masomenos {
	method anterior() = meQuieroIr
	method siguiente() = todoBien
}

object todoBien {
	method anterior() = masomenos
	method siguiente() = ganasDeSerAyudante
}

object ganasDeSerAyudante {
	method anterior() = todoBien
	method siguiente() = self
}


class Docente {
	const alumnos = []
	const temas = []

	method temasImprescindibles() = temas.filter({t=>t.imprescindible()})

	method analogia() {
		alumnos.forEach({alumno => 
			if (alumno.nivelDeAtencion() > 30) {
				alumno.aumentarNivelDeAtencion(10)
				alumno.motivado(true)
			} else {
				alumno.empeorarEstadoDeAnimo()	
			}
		})
	}

	method receso(minutos) {
		// Asumo que el alumno que los minutos del recreo no cuentan para aumentar la atencion
		// del alumno si el alumno tiene una atencion menor a 50
		alumnos.forEach({alumno => 
			if (alumno.seQuiereIrOMasOMenos() && alumno.nivelDeAtencion() < 50) {
				alumno.duplicarNivelDeAtencion()
			} else {
				alumno.aumentarNivelDeAtencion(minutos)
				alumno.mejorarEstadoDeAnimo()
			}
		})
	}

	method payasada() {
		alumnos.forEach({alumno => 
			alumno.duplicarNivelDeAtencion()
			alumno.motivado(!alumno.motivado())
			if (alumno.estadoDeAnimo() != ganasDeSerAyudante) {
				alumno.mejorarEstadoDeAnimo()
			} else {
				alumno.estadoDeAnimo(meQuieroIr)
			}
		})
	}

	method explicarTema(tema) {
		alumnos.forEach({alumno => 
			alumno.aprender(tema)
			tema.aumentarCantExplicado()
		})
	}

	method porcentajeDeAprobados() = 100 * alumnos.filter({a=>a.aprobado()}).size() / alumnos.size()

	method temaMenosAprendido() = temas.min({tema => alumnos.count({a=>a.aprendioTema(tema)})})

	method temaMenosAprendidoExplicadoDosVeces() {
		return temas.filter({tema => 
			tema.explicadoDosVeces()
		}).min({tema =>
			alumnos.count({ a => a.aprendioTema(tema)})
		})
	}

}

class Tema {
	var cantExplicado = 0
	var property imprescindible = false
	method aumentarCantExplicado() {cantExplicado += 1}
	method explicadoDosVeces() = cantExplicado >= 2
}

class TemaComplejo inherits Tema{
	const interes = 1	
	method puedeAprender(alumno) = alumno.motivado() && alumno.nivelDeAtencion() > interes * 0.9
	method aumentoDeAtencion() = interes / 2
}

class TemaSimple inherits Tema {
	const estadosDeAnimoNecesarios = [meQuieroIr, masomenos, todoBien, ganasDeSerAyudante]
	method puedeAprender(alumno) = alumno.nivelDeAtencion() > 50 && estadosDeAnimoNecesarios.contains(alumno.estadoDeAnimo())
	method aumentoDeAtencion() = 10
}