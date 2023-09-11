import colecciones2.*

class Vaca
{
	var property peso
	var property tieneSed = false
	method tieneHambre() = peso > 200
	method beber(){tieneSed = false peso -=0.2}
	method comer(racion){peso += (racion/3) tieneSed=true}
}

class Gallina
{
	method peso() = 4
	method tieneHambre() = true
	method tieneSed() = false
	method beber() {}//no se observan Cambios
	method comer() {}//no se observan Cambios
}

class Cerdo
{
	var property peso
	var property tieneHambre = false
	var vecesQueComioSinBeber = 0 
	
	method tieneSed() = vecesQueComioSinBeber > 3
	method beber(){tieneHambre = true}
	
	method comer(racion)
	{
		peso += (racion - 0.2).max(0)
		if (racion > 1) tieneHambre 0 false
	}
}


//////////////////////////////////////////////////////////////

class Bebedero
{
	method esUtilParaAtender(animal) = animal.tieneSed()
	method atender(animal){animal.beber()}
	method consumoEnergetico()= 10
}

class Comedero
{
	const pesoMaximoSoportado
	const  racion
	method esUtilParaAtender(animal)= animal.tieneHambre() && animal.peso()< pesoMaximoSoportado
	
	method atender(animal)
	{
		if (self.superaPesoMaximo(animal)) 
			self.error("el animal pesa demasiado")
			animal.comer(racion)
	}
	
	method superaPesoMaximo(animal)= animal.peso() > pesoMaximoSoportado
	
	method consumoEnergetico()= 20 * pesoMaximoSoportado
	
}


