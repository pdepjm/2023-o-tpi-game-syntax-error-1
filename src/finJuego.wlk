import wollok.game.*
import setup.*
import puntaje.*
import inicio.*
import nave.*
object finJuego {
	var property position = game.at(0,0)
	method image()="fondoanimado/fondo-1.gif"//cambiar a image de game over cuando esté lista
	method limpiar(){
			setup.removerTodosEnemigos()
			game.removeTickEvent("invocar_enemigo")	
			keyboard.r().onPressDo({
				self.reiniciar()
			})
	}
	method reiniciar(){
		game.clear()
		puntaje.reiniciar()
		nave.reiniciar()
		pulsarParaIniciar.iniciar()
	}
	
}
