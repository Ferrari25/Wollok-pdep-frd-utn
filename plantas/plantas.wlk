class Plantas
{
	const anio 
	const altura 
	
	method hsSol() {return 0}
	method esFuerte(){return self.hsSol() > 10}
	method daSemillas(){return false}
	method espacioQueOcupa(){return 0}
	method tieneParcelaIdeal(parcela){return false}
	method seAsociaEconologica(){return false}
	method seAsociaIndustrial(){return false}
}

class Menta inherits Plantas
{
	override method hsSol() = 6 
	override method daSemillas(){return self.esFuerte() || altura > 0.4}
	override method espacioQueOcupa() = altura * 3
	override method tieneParcelaIdeal(parcela){return parcela.horasSol() > 6}
	
}

class Soja inherits Plantas
{
	override method hsSol()
	{
		if (altura < 0.5){return 6}
		else if(altura>0.5 && altura <1){return 7}
		else {return 9}
	}
	
	override method daSemillas(){return self.esFuerte() || (anio > 2007 && altura >1)}
	override method espacioQueOcupa(){return altura/2 }
	
	override method tieneParcelaIdeal(parcela){return parcela.plantas().horasSol() == self.hsSol() }
}

class Quinoa inherits Plantas
{
	const nuevasHsSol
	override method hsSol(){return nuevasHsSol}
	override method esFuerte(){return nuevasHsSol > 10}
	
	override method espacioQueOcupa(){return 0.5}
	override method daSemillas(){return  self.esFuerte() || anio < 2005}
	override method tieneParcelaIdeal(parcela){return not (parcela.plantas().altura().anyOne() > 1.5)}
}

class SojaTransgenica inherits Soja
{
	override method daSemillas(){return false}
	override method tieneParcelaIdeal(parcela){return parcela.plantas().size() == 1}
}

class HierbaBuena inherits Menta
{
	override method espacioQueOcupa(){return super() * 2}
}

class Parcela
{
	const ancho
	const largo
	var property horasSol
	var property plantas = []
	
	method superficie(){return ancho * largo}
	
	method cantMaximaPlantas()
	{
		if(ancho > largo){return self.superficie()/5}
		else{ return (self.superficie() / 3) + largo}
	}
	
	
	method tieneComplicaciones(){plantas.anyOne().hsSol() < horasSol}
	
	method addPlanta(planta)
	{
		if ((planta.hsSol() < 2 + horasSol)|| (plantas.size() + 1) > self.cantMaximaPlantas()){self.error("agregar una planta supera la cant maxima")}
		plantas.add(planta)
	}
	
	
}












