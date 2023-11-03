import wollok.game.*
import setup.*
import puntaje.*
import inicio.*
import nave.*
import animador.*
import sonido.*

object finJuego {
	var property position = game.at(0,0)
	var property image = "fondoanimado/FondoGAMEOVER/gameover0.gif"
	const animador = new Animador (fuente="fondoanimado/FondoGAMEOVER/gameover", cantidad =23,extension=".gif")
	
	method animador()=animador
	
	method finDeJuego() {
		puntaje.position(game.center())
		game.schedule(3000, {	
			setup.gameClear()
			game.addVisual(self)
			game.onTick(150,"animar_final",{animador.animar(self)})
			keyboard.r().onPressDo({
				game.removeTickEvent("animar_final")
				setup.reiniciar()
				pulsarParaIniciar.iniciar()
			})
		})
	}
}
