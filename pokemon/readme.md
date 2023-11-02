Un grupo de programadores gamers se propuso desarrollar en Wollok una versión simplificada del popular juego Pokémon. La idea central del juego consiste en hacer luchar a estas simpáticas criaturas contra otras de forma estratégica.


Cada pokémon tiene un conjunto de movimientos que tienen un efecto particular, en principio vamos a trabajar con los siguientes:

Movimientos curativos: cuando se usa un movimiento curativo, el pokémon que lo usa se cura una cantidad determinada de puntos de salud que se indica para cada movimiento. Cada pokémon tiene un máximo de vida, de modo que la cantidad curada se ve limitada por ese valor.
Movimientos dañinos: cuando se usa un movimiento dañino, el pokémon enfrentado recibe un daño que depende del movimiento elegido.
Movimientos especiales: cuando se usa un movimiento especial, el pokémon enfrentado pasa a tener la condición especial que el movimiento provoca. En principio, estas condiciones pueden ser parálisis y sueño, que se detallan a continuación.

Las condiciones especiales pueden imposibilitar el movimiento del pokémon afectado durante su turno. Si se permite o no el movimiento para estas condiciones se determina tirando una moneda, para obtener un booleano al azar[1]. Si un pokémon está dormido y logra moverse su condición se normaliza. La parálisis es más persistente, por ende incluso si logra moverse en algún ataque, en el próximo turno seguirá paralizado.


Los pokemones sólo pueden luchar si están vivos, o sea, si tienen sus puntos de vida por encima de 0. A su vez, los movimientos también se agotan, cada uno tiene una cantidad determinada de usos que se decrementa cada vez que son utilizados, de modo que al no haber más usos el mismo no puede usarse en la pelea.


Se pide:

Se desea conocer la grositud de un pokémon, que se calcula como el producto entre su vida máxima y la suma del poder de sus movimientos. Los movimientos curativos tienen un poder igual a la cantidad de puntos de salud que curan, los dañinos el doble del daño que producen y los especiales un valor que se depende de qué tipo de condición generen: el sueño vale 50 y la parálisis 30.
Uso de movimientos:
Usar un movimiento entre dos pokemones, el que lo realiza y su contrincante. Al usar el movimiento se debe decrementar un uso y aplicar su efecto como corresponda. Para aplicar los efectos deben considerarse todos los tipos de movimientos previamente explicados.
Hacer que un pokémon luche con otro pokémon usando un movimiento de los que tiene disponibles (los que les quedan usos), teniendo en cuenta que sólo puede moverse si su vida es mayor a 0 y su condición se lo permite.
Si el pokemon está afectado por una condición especial, se podría interrumpir el turno sin llegar a usar el movimiento elegido.

Se agrega una nueva condición especial denominada confusión, que puede durar una cantidad de turnos indicada, luego de los cuales el pokemon se normaliza.
Cuando un pokémon confundido intenta moverse y no puede, además de no poder usar el movimiento elegido para luchar, se hace daño a sí mismo por 20 puntos de vida. Esta condición tiene un valor de 40 multiplicado por la cantidad de turnos que dure para el cálculo de grositud.