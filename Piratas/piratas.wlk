import misiones.*
import items.*

class BarcoPirata
{
	var property mision
	const property capacidad
	const property tripulantes = #{}
	
	method mision(nuevaMision)
	{
		mision = nuevaMision
		const piratasQueNoSirven= tripulantes.filter({pirata => not nuevaMision.esUtil(pirata)})
		tripulantes.removeAll(piratasQueNoSirven)
	}
	
	method cantidadDeTripulantes() = tripulantes.size()
	method puedeSerSaqueadoPor(pirata) = pirata.pasadoDeGrogXD()
	method hayLugar() = capacidad > self.cantidadDeTripulantes()
	method puedeFormarPartedeTripulacion(pirata) = self.hayLugar() && mision.esUtil(pirata)
	
	method esTemible() = self.puedeRealizarMision()&& tripulantes.count{pirata => mision.esUtil(pirata)}
	
	method puedeRealizarMision() = mision.puedeSerRealizadaPor(self)
	
	//TODO
	method superaPorcetanjeDeOcpacion() = false
	method tieneItem(item) = false
	method tripulacionPasadaDeGrogXD() = false
	//
	
	method esVulnerable(barco) = barco.cantidadDeTripulantes() / 2  >= self.cantidadDeTripulantes() 
	
	method incorporarATripulacion(pirata)
	{
		if(not self.puedeFormarPartedeTripulacion(pirata)){self.error("no se puede subir al barco")}
		tripulantes.add(pirata)
	}
}




class Pirata{
	var property monedas = 0
	const property items = []
	var property ebriedad = 0
	
	method agregarItem(item) = items.add(item)
	method removerItem(item) = items.remove(item)
	method tieneItem(item) = items.contains(item)
	method cantidadDeItems()= items.size()
	method beber() = ebriedad + 10
	
	method seAnimaASaquearA(victima) = victima.puedeSerSaqueadoPor(self)
	method pasadoDeGrogXD() = self.ebriedad() >= 90 && self.tieneItem("botella de GrogXD")
}


	
	
	
	
	
	
class CiudadCostera
{	
	var property cantidadDeHabitantes = 0
	method puedeSerSaqueadoPor(pirata)= pirata.ebriedad() >= 50
	
	method esVulnerableA(barco) = barco.cantidadDeTripulantes() >= self.cantidadDeHabitantes() * 0.4 || barco.tripulacionPasadaDeGrogXD()
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	