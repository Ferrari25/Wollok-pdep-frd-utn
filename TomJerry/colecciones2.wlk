import colecciones.*

class EstacionDeAtencion 
{
	const property dispositivos = #{}
	
	method agregarDispositivo(dispositivo){dispositivos.add(dispositivo)}
	
	method quitarDispositivo(dispositivo){dispositivos.remove(dispositivo)}
	
	method consumoEnergetico()= dispositivos.sum({dispositivo =>
	 	dispositivo.consumoEnergetico()
	 }) * 1.1
	 
	 
	 method puedeAtender(animal)= dispositivos.any({dispositivo => dispositivo.esUtilParaAtender(animal)})

	method dispositivosUtiles(animal)= dispositivos.filter({dispositivo => dispositivo.esUtilParaAtender(animal)})

	method atencionBasica(animal){
		self.validarQuePuedeAtender(animal)
		const dispositivoAusar=self.dispositivosUtiles(animal).min({dispositivo=>dispositivo.consumoEnergetico()})
		dispositivoAusar.atender()
	}
	
	method atencionCompleta(animal){
		self.validarQuePuedeAtender(animal)
			self.error("el animal no puede atenderse")
		self.dispositivosUtiles(animal).forEach({dispositivo =>dispositivo.atender(animal)})
		
	}
	
	method validarQuePuedeAtender(animal){
		if(not self.puedeAtender(animal))
		self.error("el animal no puede ser atendido")
	}
	
	
	
	
}
