import wollok.game.*
import bala.*
import nave.*
import animador.*
	
class Enemigo {
	var property energia
	var property vidas = 3
	const animador = new Animador(imagenes = [
		"dragonrojo/DRAGON-13.png",
		"dragonrojo/DRAGON-15.png",
		"dragonrojo/DRAGON-16.png",
		"dragonrojo/DRAGON-17.png",
		"dragonrojo/DRAGON-18.png",
		"dragonrojo/DRAGON-14.png"
	])

	var property position
	var property image = animador.imagenInicial()

	const color = ["verde","amarillo","rojo"]
	
	method energia()=energia
	method energia(nuevaEnergia){energia = nuevaEnergia}
	
	method vidas() = vidas
	method vidas(nuevoValor){vidas = nuevoValor}
		
	method perderEnergia (){}

	method perderVida() {
		vidas = vidas - 1
		if (vidas == 0) {
			self.morir()
		}
	}

	method moverse() {
		const dirX = nave.position().x() - self.position().x()
		const dirY = nave.position().y() - self.position().y()
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
		
		if(dirX.abs() <= 5) {
			self.seguir_jugador(dirX,dirY)
		}else {
			self.position(direccion.anyOne())
		}
		
		self.evitar_limites()
	}
	
	method seguir_jugador(dirX,dirY) {
		const modulo = (dirX**2 + dirY**2).squareRoot() // para normalizar el vector
		
		if(dirY.abs() >= 35) {
			// se mueve en dirección al jugador
			self.position(game.at(self.position().x() + dirX/modulo, self.position().y() + dirY/modulo))
		}
		else {
			self.position(game.at(self.position().x() + dirX/modulo, self.position().y()))
		}
	}
	
	method evitar_limites() {
		const posicionLimite = game.at(game.width(),game.height())
		
		if(self.position().distance(posicionLimite) < 5){
			if(self.position().x() == game.width() - 3) self.position(position.left(1))
			if(self.position().x() == 3) self.position(position.right(1))
			if(self.position().y() == (game.height() - 3)) self.position(position.down(1))
		}
	}
	
	method animar() {
		animador.animar(self)
	}
	
	method disparar() {}

	method morir() {
		game.removeVisual(self)
	}

}






