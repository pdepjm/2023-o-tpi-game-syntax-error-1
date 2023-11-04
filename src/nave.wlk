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
	var disparoDisponible = true
	var property image = "nave1.png"
	
	method spawn() {
		game.addVisual(self)
		self.moverse()
    	keyboard.space().onPressDo{ self.disparar() }
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

  		if(disparoDisponible) {
  			disparoDisponible = false
	  		new Disparo( position = self.position().up(1), direccion = 1).spawn()
		  	soundProducer.sound("disparo.wav").play()
		  	
		  	game.schedule(250, {disparoDisponible = true})
		  }					
  	}
  	
  	method matar(enemigo) {
  		puntaje.puntaje(enemigo.valorPuntosEnemigo())
  		enemigo.morir()
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
	const position = game.at(0,12)
	
	method position() = position
	
	method image(vidas){
		image = imagenes.get(vidas)
	} 
}
