import wollok.game.*
import setup.*
import puntaje.*
import animador.*
import enemigo.*
import nave.*
import sonido.*

object pulsarParaIniciar { 
	var property position = game.at(0,0)
	var property image = "fondoanimado/Fondo/fondo0.gif"
	const animador = new Animador (fuente="fondoanimado/Fondo/fondo", cantidad =59,extension=".gif")

	method animar() { animador.animar(self) }
	
	method introduccion(){
		game.onTick(16.6, "animar_introduccion",{animador.animar(self)})
		
		setup.setupEnemigo(1000)
		setup.setupAnimacion()
		
		game.onTick(1000, "animación_enemigo", {
			game.schedule(3000, { 
				try {
					const enemigo = setup.enemigos().get(0)
					setup.removerEnemigos(enemigo)
					enemigo.morir()
				}	
				catch e {}
			})			
		})
	}
	
	method iniciar(){
		setup.setupBoard()
		game.addVisual(self)
		self.introduccion()
		keyboard.enter().onPressDo({
			setup.gameClear()
			game.addVisual(puntaje)
			setup.setupJugador()
			setup.setupEnemigo(3000)
			setup.setupAnimacion()
			setup.setupDisparos()		
		})
	}
}
