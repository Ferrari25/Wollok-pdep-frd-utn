/* COMENTARIOS
 * 
 * ----ejemplos de bloques con colecciones
 * animales.max({animales => animal.peso()})
 * animales.find({animales => animal.peso() > 250})
 * animales.forEach({animales => animal.comer(0.3)})
 * 
 * estos ejemplos crea una nueva lista con las acciones indicadas pero no modifica la original
 * 
 * ---tipos de colecciones
 * [] ó new List()
 * 			admite repetidos
 * 			tiene orden
 * 
 * #{} ó new Set()
 * 			no tiene repetido / es como en los conjuntos matematicos  
 * 			no tiene orden 
 * 
 * --- conversiones inmutables
 * asSet() 
 * 
 * asList() y sortedBy(unBloque)
 * 
 * ventajas: son polimorficas / elegismos el tipo inicial conveniente y creamos otra cuando haga falta
 */
class Vaca {
	var property peso
	var property tieneSed = false
	method tieneHambre() = peso < 200
	
	method beber(){
		tieneSed = false
		peso -= 0.5
	}
	method comer(racion){
		peso += racion / 3
		tieneSed = true
	}
}

class Cerdo {
	var property peso
	var property tieneHambre = false
	var vecesQueComioSinBeber = 0
	
	method tieneSed()= vecesQueComioSinBeber > 3
    
	method beber(){
		tieneHambre = true
		vecesQueComioSinBeber = 0
	}
	method comer(racion){
		peso += (racion - 0.2).max(0)
		vecesQueComioSinBeber +=1
		if(racion > 1){
			tieneHambre = false
		}
	}
}

class Gallina {
	method peso() = 4
	method tieneHambre() = true
	method tieneSed() = false
	method beber(){}
	method comer(racion){}
}


class Bebedero {
	method esUtilParaAtender(animal) = animal.tieneSed()	
	method atender(animal){animal.beber()}
	method consumoEnergetico() = 10}

class Estacion{
	const property dispositivos = #{}
	
	method agregarDispositivos(disp){dispositivos.add(disp)}
	
	method removerDispositivos(disp){dispositivos.remove(disp)}
	
	method consumoEnegeticos() = dispositivos.sum({dispositivo => dispositivo.consumoEnergetico()}) * (1.1)
}
