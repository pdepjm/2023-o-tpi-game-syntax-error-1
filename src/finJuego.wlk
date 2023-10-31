import wollok.game.*
import setup.*
import puntaje.*
import inicio.*
import nave.*
object finJuego {
	var property position = game.at(0,0)
	method image()="fondoanimado/fondo-1.gif"//cambiar a image de game over cuando esté lista

	method finDeJuego() {
		game.schedule(2000, {
			setup.gameClear()
			game.addVisual(self)
			keyboard.r().onPressDo({
				pulsarParaIniciar.iniciar()
			})
		})
	}
}
