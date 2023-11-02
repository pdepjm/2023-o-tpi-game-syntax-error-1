import wollok.game.*
import setup.*
import puntaje.*
import inicio.*
import nave.*
import animador.*

object finJuego {
	var property position = game.at(0,0)
	var property image = "fondoanimado/FondoGAMEOVER/gameover00.gif"
	const animador = new Animador (imagenes = [
		"fondoanimado/FondoGAMEOVER/gameover01.gif",
		"fondoanimado/FondoGAMEOVER/gameover02.gif",
		"fondoanimado/FondoGAMEOVER/gameover03.gif",
		"fondoanimado/FondoGAMEOVER/gameover04.gif",
		"fondoanimado/FondoGAMEOVER/gameover05.gif",
		"fondoanimado/FondoGAMEOVER/gameover06.gif",
		"fondoanimado/FondoGAMEOVER/gameover07.gif",
		"fondoanimado/FondoGAMEOVER/gameover08.gif",
		"fondoanimado/FondoGAMEOVER/gameover09.gif",
		"fondoanimado/FondoGAMEOVER/gameover10.gif",
		"fondoanimado/FondoGAMEOVER/gameover11.gif",
		"fondoanimado/FondoGAMEOVER/gameover12.gif",
		"fondoanimado/FondoGAMEOVER/gameover13.gif",
		"fondoanimado/FondoGAMEOVER/gameover14.gif",
		"fondoanimado/FondoGAMEOVER/gameover15.gif",
		"fondoanimado/FondoGAMEOVER/gameover16.gif",
		"fondoanimado/FondoGAMEOVER/gameover17.gif",
		"fondoanimado/FondoGAMEOVER/gameover18.gif",
		"fondoanimado/FondoGAMEOVER/gameover19.gif",
		"fondoanimado/FondoGAMEOVER/gameover20.gif",
		"fondoanimado/FondoGAMEOVER/gameover21.gif",
		"fondoanimado/FondoGAMEOVER/gameover22.gif",
		"fondoanimado/FondoGAMEOVER/gameover23.gif",
		"fondoanimado/FondoGAMEOVER/gameover24.gif",
		"fondoanimado/FondoGAMEOVER/gameover22.gif",
		"fondoanimado/FondoGAMEOVER/gameover21.gif",
		"fondoanimado/FondoGAMEOVER/gameover20.gif",
		"fondoanimado/FondoGAMEOVER/gameover19.gif",
		"fondoanimado/FondoGAMEOVER/gameover18.gif",
		"fondoanimado/FondoGAMEOVER/gameover17.gif",
		"fondoanimado/FondoGAMEOVER/gameover16.gif",
		"fondoanimado/FondoGAMEOVER/gameover15.gif",
		"fondoanimado/FondoGAMEOVER/gameover14.gif",
		"fondoanimado/FondoGAMEOVER/gameover13.gif",
		"fondoanimado/FondoGAMEOVER/gameover12.gif",
		"fondoanimado/FondoGAMEOVER/gameover11.gif",
		"fondoanimado/FondoGAMEOVER/gameover10.gif",
		"fondoanimado/FondoGAMEOVER/gameover09.gif",
		"fondoanimado/FondoGAMEOVER/gameover08.gif",
		"fondoanimado/FondoGAMEOVER/gameover07.gif",
		"fondoanimado/FondoGAMEOVER/gameover06.gif",
		"fondoanimado/FondoGAMEOVER/gameover05.gif",
		"fondoanimado/FondoGAMEOVER/gameover04.gif",
		"fondoanimado/FondoGAMEOVER/gameover03.gif",
		"fondoanimado/FondoGAMEOVER/gameover02.gif"
	])
	
	method animador() = animador

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
