import wollok.game.*
import setup.*
import puntaje.*
import inicio.*
import nave.*
import animador.*
import sonido.*

object finJuego {
	var property position = game.at(0,0)
	var property image = "fondofinal/gameover0.gif"
	const animador = new Animador (fuente="fondofinal/gameover", cantidad =73,extension=".gif")
	
	method animar() { animador.animar(self) }
	 
	method finDeJuego() {
		//puntaje.position(game.center())
		game.schedule(3000, {
			  setup.gameClear()
			  game.addVisual(self)
			  game.onTick(60,"animar_final",{ self.animar() })
			  keyboard.r().onPressDo({
				  game.clear()
				  setup.reiniciar()
				  pulsarParaIniciar.iniciar()
			})
		})
	}
}
