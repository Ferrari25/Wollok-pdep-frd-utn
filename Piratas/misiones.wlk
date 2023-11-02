import items.*
import piratas.*

class Mision 
{
	method puedeSerRealizadaPor(barco)
	{
		return barco.superaPorcetanjeDeOcpacion(90) && self.cumpleCoindicionesParaRealizarla(barco)
	}
	
	method cumpleCoindicionesParaRealizarla(barco) = true
}
//---------------------------------------------------------------

class BusquedaDelTesoro inherits Mision 
{
	method esUtil(pirata)= self.tieneAlgunItemUtil(pirata) && pirata.monedas() <= 5 
	
	method tieneAlgunItemUtil(pirata) = 
	#{"brujula","mapa","botella de GrogXD"}.any({item => pirata.tieneItem(item)})
	
	
	override method cumpleCoindicionesParaRealizarla(barco) = barco.tieneItem(llaveDeCofre)
}
//---------------------------------------------------------------

class ConvertirseEnLeyenda inherits Mision 
{	
	const itemObligatorio 
	method esUtil(pirata) = pirata.cantidadDeItems() >= 10 && pirata.tieneItem(itemObligatorio)
}
//---------------------------------------------------------------

class Saqueo inherits Mision 
{	
	const property victima
	method esUtil(pirata) 
		= pirata.monedas() < self.maximoDeMonedas()
			&& pirata.seAnimaASaquearA(victima)
			
	method maximoDeMonedas() = configuracionSaqueos.maximoDeMonedas()
	
	override method cumpleCoindicionesParaRealizarla(barco) = victima.esVulnerable(barco)
}

object configuracionSaqueos{var property maximoDeMonedas = 0}
//---------------------------------------------------------------

