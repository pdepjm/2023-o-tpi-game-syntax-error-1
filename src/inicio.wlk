import wollok.game.*
import setup.*
import puntaje.*
import animador.*
import enemigo.*
import nave.*
import sonido.*

object pulsarParaIniciar { 
	var property position = game.at(0,0)
	var property image = "fondoanimado/fondoanimado0.gif"
	const animador = new Animador (fuente="fondoanimado/fondoanimado", cantidad =73,extension=".gif")

	method animar() { animador.animar(self) }
	
	method introduccion(){
		game.onTick(60, "animar_introduccion",{animador.animar(self)})
		
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
			setup.setupPuntajeDigital()
			setup.setupJugador()
			setup.setupEnemigo(3000)
			setup.setupAnimacion()
			setup.setupDisparos()		
		})
	}
}
