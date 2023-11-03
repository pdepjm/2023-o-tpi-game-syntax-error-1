import wollok.game.*
import animador.*
import sonido.*
import bala.*
import puntaje.*
import finJuego.*
import setup.*

object nave {
	var vidas = 3
	var property position = game.at(game.width()/2,0)
	const animador = new Animador(fuente="explosion/Explosion-",cantidad=12,extension=".png")

	var property image = "nave1.png"
	var balaDisponible = true
	
	method spawn() {
		game.addVisual(self)
		self.moverse()
    	keyboard.space().onPressDo{self.disparar()}
    	game.addVisual(vidaActual)
	}
	
	method moverse() {
		keyboard.a().onPressDo({ 
			if(position.x() >= 1 ) self.position(position.left(1))
		})
		keyboard.d().onPressDo({
		    if(position.x() < game.width()-1) self.position(position.right(1))
		})
	}
  		
  	method disparar(){
  		if(balaDisponible) {
	  			const disparo = new Disparo( position = self.position().up(1), direccion = 1)
	  			disparo.spawn()
		  		soundProducer.sound("disparo.wav").play()
		  		balaDisponible = false
		  		
		  		game.schedule(250, {balaDisponible = true})
		  	}
  	}
    
  	method sufrirDanio(danio) {
  		if(vidas <= 0) {
  			self.morir()
  		}else {
  			vidas = vidas - danio
  			vidaActual.image(vidas)
  		}
  	}
  	
  	method matarEnemigo(enemigo) {
  		enemigo.morir()
  		puntaje.puntaje(enemigo.valorPuntosEnemigo())
  	}
    
	method morir() {
		animador.fuente("explosion/Explosion-")
		animador.cantidad(8)
		animador.extension(".png")
		animador.animarYRemover(self)
		finJuego.finDeJuego()
	}
	
	method reiniciar(){
		vidas = vidas + 3
		image = "nave1.png"
		vidaActual.image(vidas)
		self.position(game.at(game.width()/2,0))
	}
}
object vidaActual {
	var property image = "corazon/corazon-1.png"
	const imagenes = [
		"corazon/corazon-4.png",
		"corazon/corazon-3.png",
		"corazon/corazon-2.png",
		"corazon/corazon-1.png"
	]
	var property position = game.at(0,12)
	
	method image(vidas){
		image = imagenes.get(vidas + 1)
	} 
}
