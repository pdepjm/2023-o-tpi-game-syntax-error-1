import wollok.game.*

object puntaje {
	var property puntaje = 0
	var property position = game.at(game.width()/2,game.height() - 1)
	method text() = puntaje.toString()
	method textColor() = "00FF00FF" 
	method puntaje(puntajeAgregado){puntaje = puntaje+puntajeAgregado} 
	method reiniciar(){
		puntaje = 0
	 	position = game.at(game.width()/2,game.height() - 1)
	}
}
