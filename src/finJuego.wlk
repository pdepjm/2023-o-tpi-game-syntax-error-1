import wollok.game.*
import setup.*
import puntaje.*
import inicio.*
import nave.*

object finJuego {
	const position = game.at(0,0)
	method image()="fondoanimado/fondo-1.gif"//cambiar a image de game over cuando esté lista
	method limpiar(){	
			keyboard.r().onPressDo({
				self.reiniciar()
			})
	}
	method reiniciar(){
		keyboard.r().onPressDo({
			game.clear()
			puntaje.reiniciar()
			nave.reiniciar()
			pulsarParaIniciar.iniciar()
		})
	}
}
