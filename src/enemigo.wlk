import wollok.game.*
import bala.*
import nave.*
	
class Enemigo {

	var property energia
	var property vidas = 3

	var posX = 0
	var posY = 30

	var property position

	const color = ["verde","amarillo","rojo"]
	
	method energia()=energia
	method energia(nuevaEnergia){energia = nuevaEnergia}
	
	method vidas() = vidas
	method vidas(nuevoValor){vidas = nuevoValor}
		
	method perderEnergia (){

 	}

	method image() = "nave1.png"

	method perderVida() {
		vidas = vidas - 1
		if (vidas == 0) {
			self.morir()
		}
	}

	method moverse() {
		const direccion = [
			position.up(1),
			position.down(1),
			position.right(1),
			position.left(1),
			position.up(1).right(1),
			position.up(1).left(1),
			position.down(1).right(1),
			position.down(1).left(1)
		]
		
		self.position(direccion.anyOne())
		self.evitar_limites()
		self.seguir_jugador()
	}
	
	method seguir_jugador() {
		var distanciaX = position.x - nave.position().x
		
		if(distanciaX < 2) {
			var xDir = position.x - nave.position().x
			var yDir = position.y - nave.position().y
			var modulo = (xDir**2 + yDir**2).squereRoot()
			
			self.position(game.at(xDir/modulo, yDir/modulo)
		}
	}
	
	method evitar_limites() {
		const posicionLimite = game.at(game.width(),game.height())
		if(self.position().distance(posicionLimite) < 5) {
			if(position == game.width() - 3) self.position(position.left(1))
			if(position == 3) self.position(position.right(1))
			if(position == game.height() - 3) self.position(position.down(1))
		}
	}
	
	method disparar() {
	}

	method morir() {
		game.removeVisual(self)
	}

}






