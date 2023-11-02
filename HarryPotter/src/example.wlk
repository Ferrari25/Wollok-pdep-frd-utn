class Mago {
	var property iq = 0
	var property casa
	var property seguidores = []
	var vida = 1000
	var energia = 1000
	var property poderDeVarita
	var property hechizos = []

	method nivelInteligencia() {
		// 0: no es inteligente
		// 1: inteligencia promedio
		// 2: muy inteligente
		if (iq >= 120) {
			return 2
		} else if (iq >= 80) {
			return 1
		} else {
			return 0
		}
	}

	method masInteligenteQue(mago) = self.iq() > mago.iq()
	method mismaCasaQue(mago) = casa == mago.casa()
	method esFamoso() = seguidores.size() > 3

	method puedeSeguir(mago) = self.mismaCasaQue(mago) && mago != self && (mago.masInteligenteQue(self) || mago.esFamoso())

	method seguir(mago) {
		mago.seguidores().add(self)
	}
	
	method lanzarHechizo(hechizo, mago) {
		if (hechizos.contains(hechizo) && energia >= hechizo.energiaRequerida()) {
			hechizo.lanzar(self, mago)
		}
	}

	method lanzarHechizoConMenorEnergiaRequerida(mago) {
		const hechizo = hechizos.min({h => h.energiaRequerida()})
		self.lanzarHechizo(hechizo, mago)
	}

	method aprenderHechizo(hechizo) {
		if (hechizo.puedeAprenderlo(self)) {
			hechizos.add(hechizo)
		}
	}

	method sumarVida(cant) {
		vida = (vida + cant).max(0)
	}
	method sumarEnergia(cant) {
		energia = (energia + cant).max(0)
	}

	method estaMuerto() = vida <= 0
}

object gryffindor {
	method puedeIr(mago) = mago.nivelInteligencia() == 1 || mago.esPelirrojo()
}

object ravenclaw {
	method puedeIr(mago) = mago.nivelInteligencia() == 2 || mago.esPelirrojo()
}

object slytherin {
	method puedeIr(mago) = !mago.esSangreSucia()
}

object hufflepuff {
	method puedeIr(mago) = true
}

object sombrero {
	var casas = [gryffindor, slytherin, ravenclaw, hufflepuff]

	method seleccionarCasa(mago) = casas.filter({c => c.puedeIr(mago)}).first()
}

class hechizoSanador {
	var property energiaRequerida

	method lanzar(magoLanzador, magoReceptor) {
		if (!magoReceptor.estaMuerto()) {
			magoLanzador.sumarVida(energiaRequerida * 2)
		}
		magoLanzador.sumarEnergia(-1 * energiaRequerida)
	}

	method puedeAprenderlo(mago) {
		mago.esFamoso()
	}
}

class HechizoCombate {
	var property energiaRequerida = 200
	var coefHechizo

	method lanzar(magoLanzador, magoReceptor) {
		magoReceptor.sumarVida(5*coefHechizo + magoLanzador.poderDeVarita())
		magoLanzador.sumerEnergia(-1 * energiaRequerida)
	}
}

class HechizoImperdonable {
	var property energiaRequerida = 0
	var coefHechizo

	method lanzar(magoLanzador, magoReceptor) {
		var x = coef - 4*magoLanzador.seguidores().size()
		magoLanzador.sumarVida(-1 * x)	
		magoReceptor.sumarVida(-2 * x)	
	}
}