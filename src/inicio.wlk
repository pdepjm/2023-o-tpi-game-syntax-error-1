import wollok.game.*
import setup.*
import puntaje.*

object pulsarParaIniciar {
	var property position = game.center()
	var property image = "inicio.png"
	method iniciar(){
		setup.setupBoard()
		game.addVisual(self)
		keyboard.enter().onPressDo({
			setup.setupPlayer()
			game.addVisual(puntaje)
			setup.setupEnemy()
			setup.setupBala()
			game.removeVisual(self)
		})
	}
}
