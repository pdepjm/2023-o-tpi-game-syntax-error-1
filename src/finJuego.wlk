import wollok.game.*
import setup.*
import puntaje.*
import inicio.*
import nave.*
import animador.*

object finJuego {
	var property position = game.at(0,0)
	var property image = "fondoanimado/FondoGAMEOVER/gameover00.gif"
	const animador = new Animador (direccion="fondoanimado/FondoGAMEOVER/gameover", cantidad =23,extension=".gif")
	method animador()=animador
	method finDeJuego() {
		puntaje.position(game.center())
		
		game.schedule(3000, {
			setup.gameClear()
			game.addVisual(self)
			game.onTick(100,"animar_fondo",{animador.animar(self)})
			keyboard.r().onPressDo({
				game.removeTickEvent("animar_fondo")
				setup.reiniciar()
				pulsarParaIniciar.iniciar()
			})
		})
	}
}
