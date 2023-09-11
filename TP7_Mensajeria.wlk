import TP7_Mensajeros.*

object mensajeria 
{
    const mensajeros = new List()
    method initLista(lista){lista.add(neo) lista.add(chuck) lista.add(roberto) lista.add(neo)}
    method contratarA(lista,mensajero) = lista.add(mensajero)
    method despedirA(lista,mensajero)= lista.remove(mensajero)
    method depedirTodos(lista)= lista.clear()
    method mensajeriaGrande(lista)= lista.size() > 2 
	
	method pEPE(lista,paquet)= (paquet.puedeSerEntregadoPor(lista.last())) // pEPE = PUEDE ENTREGAR PRIMER EMPLEADO

	method pUE(lista) = lista.last().peso() //pUE = PESO ULTIMO EMPLEADO
	
		
	method calcularPromedioDePeso() 
	{
		//var sumaDePesos = 0
		var sumaDePesosTotales = 0
		
		// ESTE HIJO DE RE MIL PUTA ME DIVIDE POR CERO Y NOS XQ
		
        mensajeros.forEach({mensajero => sumaDePesosTotales = sumaDePesosTotales + mensajero.Peso()})
        return sumaDePesosTotales / mensajeros.size()
     }

}






