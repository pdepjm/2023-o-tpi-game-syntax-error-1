import wollok.game.*
import setup.*
import puntaje.*
import inicio.*
import nave.*

object finJuego {
	var property position = game.at(0,0)
	method image()="fondoanimado/FondoGAMEOVER/gameover00.gif"

	method finDeJuego() {
		puntaje.position(game.center())
		
		game.schedule(3000, {
			setup.gameClear()
			game.addVisual(self)
			keyboard.r().onPressDo({
				setup.reiniciar()
				pulsarParaIniciar.iniciar()
			})
		})
	}
}
