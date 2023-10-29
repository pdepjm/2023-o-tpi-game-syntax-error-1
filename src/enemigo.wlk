import wollok.game.*
import bala.*
import nave.*
import animador.*
import setup.*
import puntaje.*
class Enemigo {
	var vidas 
	const animador 
	var property position
	const valorPuntosEnemigo
	
	var property image 
	
	method animador() = animador
	
	method vectorAJugador() {
		const dirX = nave.position().x() - self.position().x()
		const dirY = nave.position().y() - self.position().y()
		
		return new Position(x=dirX, y=dirY)
	}

	method moverse() {
		const vecAJugador = self.vectorAJugador()
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

		if(vecAJugador.x().abs() <= 5) {
			self.seguirJugador(vecAJugador.x(),vecAJugador.y())
		}else {
			self.position(direccion.anyOne())
		}
		
		self.evitarLimites()
	}
	method seguirJugador(dirX,dirY) {
		const modulo = (dirX**2 + dirY**2).squareRoot() // para normalizar el vector
		
		if(dirY.abs() >= 6) {
			// se mueve en dirección al jugador
			self.position(game.at(self.position().x() + dirX/modulo, self.position().y() + dirY/modulo))
		}
		else {
			self.position(game.at(self.position().x() + (dirX/modulo)*2, self.position().y()))
		}
	}
	
	method evitarLimites() {
		const posicionLimite = game.at(game.width(),game.height())
		
		if(self.position().distance(posicionLimite) < 8){
			if(self.position().x() < game.width() - 6) self.position(position.left(1))
			if(self.position().x() < 6) self.position(position.right(1))
			if(self.position().y() < (game.height() - 6)) self.position(position.down(1))
		}
	}
  
  	method disparar() {
  		const vecAJugador = self.vectorAJugador()
  		
  		if(vecAJugador.x().abs() <= 10) {
			  const disparo = new Disparo(position = position.down(1), direccion = -1)
			  disparo.spawn()
		  }
  	}
  	
	method sufrirDanio(danio) {
  		if(vidas == 0) {
  			self.morir()
  		}else {
  			vidas = vidas - danio
  		}
  	}

	method morir() {
		animador.imagenes([
			"nubeverde/NUBEVERDE.png",
			"nubeverde/NUBEVERDE-02.png",
			"nubeverde/NUBEVERDE-03.png",
			"nubeverde/NUBEVERDE-04.png",
			"nubeverde/NUBEVERDE-05.png",
			"nubeverde/NUBEVERDE-06.png"
		])
		puntaje.puntaje(valorPuntosEnemigo)
		setup.removerEnemigos(self)
		animador.animarYRemover(self)
	}
}

class DragonRojo inherits Enemigo(
	image = "dragonrojo/DRAGON-13.png",
	animador = new Animador(imagenes = [
		"dragonrojo/DRAGON-13.png",
		"dragonrojo/DRAGON-15.png",
		"dragonrojo/DRAGON-16.png",
		"dragonrojo/DRAGON-18.png",
		"dragonrojo/DRAGON-14.png"
	]),
	vidas = 1,
	valorPuntosEnemigo = 10
){}

class Moluscocerebro inherits Enemigo(
	image = "moluscocerebro/MOLUSCOCEREBRO.png",
	animador = new Animador(imagenes = [
		"moluscocerebro/MOLUSCOCEREBRO-02.png",
		"moluscocerebro/MOLUSCOCEREBRO-03.png",
		"moluscocerebro/MOLUSCOCEREBRO-04.png"
	]),
	vidas = 2,
	valorPuntosEnemigo = 50
){}

class PajarosVerdes inherits Enemigo(
	image = "pajarosverdes/pajarosverdes-02.png",
	animador = new Animador(imagenes = [
		"pajarosverdes/pajarosverdes-03.png",
		"pajarosverdes/pajarosverdes-04.png",
		"pajarosverdes/pajarosverdes-05.png",
		"pajarosverdes/pajarosverdes-06.png",
		"pajarosverdes/pajarosverdes-07.png",
		"pajarosverdes/pajarosverdes-08.png",
		"pajarosverdes/pajarosverdes-09.png"
	]),
	vidas = 5 , valorPuntosEnemigo = 100)
{}
