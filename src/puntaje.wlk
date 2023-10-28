import wollok.game.*

object puntaje {
	var property puntaje = 0
	var property position = game.at(game.width()/2 -1,game.height()-3)
	method text() = puntaje.toString()
	method textColor() = "00FF00FF" 
	method puntaje(puntajeAgregado){puntaje = puntaje+puntajeAgregado} 
}
