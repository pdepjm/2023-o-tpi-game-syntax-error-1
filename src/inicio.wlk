import wollok.game.*
import setup.*
import puntaje.*

object pulsarParaIniciar {
	var property position = game.at(4,17)
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
