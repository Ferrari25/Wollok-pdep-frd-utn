//PARTE 1

//TOM TIENE UNA CANTIDAD DE ENERGIA QUE VARIA A LO LARGO DEL JUEGO DEPENDIENDO DE SUS ACTIVIDADES DE COMER 
//RATONES Y DE CORRER. TAMBIEN SERA RELEVANTE LA VELOCIDAD A LA QUE ES CAPAZ DE CORRER.
//	*LA VELOCIDAD DE TOM ES 5m/s + SU ENERGIA /10
//	*CUANDO TOME COME UN RATON, SU ENERGIA AUMENTA EN 12 + EL PESO DEL RATON
//	*CUANDO TOM CORRE DURANTE UNA CANTIDAD DE SEGUNDOS INDICA, SU ENERGIA DISMINUYE EN 0.5 x CANT METROS QUE CORRIO

//PARTE 2

//NECESITAMOS PODER DETERMINAR SI A TOM LE CONVIENE CORRER A UN RATON QUE SE ENCUENTRA A UNA DISTANCIA
//INDICADA (EN METROS), ESTO SERA CIERTO SI TOM ES MAS VELOZ QUE EL RATON, y ADEMAS LA ENERGIA QUE 
//GANARIA POR COMER AL RATON ES MAYOR A LA QUE CONSUMIRA CORRIENDO ESA DISTANCIA 
// !NO REPETIR LOGICA
object tom 
{
	var property energia = 80	

	method velocidad()= 5 + (energia/10)
	
	method comer(raton){ energia += self.energiaQueGanariaComiendo(raton)}
	
	method correr(segundos){energia -= self.energiaQuePerderiaCorriendo(self.metrosQueCorre(segundos))}
	
	method metrosQueCorre(segundos)= segundos * self.velocidad()
	
	method convieneCorrerRatonA(raton,distanciaMetros) = 
		self.velocidad() > raton.velocidad()&&
		self.energiaQueGanariaComiendo(raton) > self.energiaQuePerderiaCorriendo(distanciaMetros)
		
	method energiaQueGanariaComiendo(raton)= 12 + raton.peso()
	
	method energiaQuePerderiaCorriendo(distanciaMetros) = 0.5 * distanciaMetros
	
}

object jerry 
{
	var property velocidad = 1	
	
	method acelerar(){velocidad = velocidad * 1.5}
	method peso(){return 5}
}

