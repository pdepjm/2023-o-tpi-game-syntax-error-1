import wollok.game.*

object vidaActual {
	var property image = "corazon/corazon-1.png"
	const imagenes = [
		"corazon/corazon-4.png",
		"corazon/corazon-3.png",
		"corazon/corazon-2.png",
		"corazon/corazon-1.png"
	]
	const position = game.at(0,12)
	
	method position() = position
	
	method image(vidas){
		image = imagenes.get(vidas)
	} 
}
