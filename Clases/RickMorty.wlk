
object gromflomite{
	var property energia = 100
	method recibirDanio(danio){energia = energia - danio/5}
	method poder() = 50
}

class Glorzo{
	var property anfitrion 
	method recibirDanio(danio){anfitrion.energia(anfitrion.energia()- danio)}
	method poder() = anfitrion.poder()
}

object rick{
	var property energia = 100
	var  poderBase = 200
	const poderPistola = 50
	method poder()= poderBase + poderPistola
	
	method atacarA(contrincante){
		if(self.poder() > contrincante.poder())
			{poderBase += 10}
		else
			{energia -= 50}
		contrincante.recibirDanio(self.poder())
	}
	
	method esDeSuDimension(morty) = morty.dimension() == "tierra1"
}

const mortyOrtiginal = new Morty(dimension = "tierra1" )


class Morty{
	var property energia = 50
	const poderBase = 100
	const property dimension
	
	method poder(){
		if (self.traumado()){
			return poderBase*3
		}else 
			return 100
	}
	
	method traumado()= energia < 30
	
	method atacarA(contrincante){energia -=10}
}
