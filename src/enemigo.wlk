import wollok.game.*
import bala.*
import nave.*
import animador.*
import setup.*
import puntaje.*
class Enemigo {
	var property vidas 
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

		if(vecAJugador.x().abs() <= 20) {
			self.seguirJugador(vecAJugador.x(),vecAJugador.y())
		}else {
			self.position(direccion.anyOne())
		}
		
		self.evitarLimites()
	}
	method seguirJugador(dirX,dirY) {
		const modulo = (dirX**2 + dirY**2).squareRoot() // para normalizar el vector
		
		if(dirY.abs() >= 15) {
			// se mueve en dirección al jugador
			self.position(game.at(self.position().x() + dirX/modulo, self.position().y() + dirY/modulo))
		}
		else {
			self.position(game.at(self.position().x() + (dirX/modulo)*2, self.position().y()))
		}
	}
	
	method evitarLimites() {
		const posicionLimite = game.at(game.width(),game.height())
		
		if(self.position().distance(posicionLimite) < 5){
			if(self.position().x() == game.width() - 3) self.position(position.left(1))
			if(self.position().x() == 3) self.position(position.right(1))
			if(self.position().y() == (game.height() - 3)) self.position(position.down(1))
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
			"nubeverde/ExplosionVerde-0.png",
			"nubeverde/ExplosionVerde-1.png",
			"nubeverde/ExplosionVerde-2.png",
			"nubeverde/ExplosionVerde-3.png",
			"nubeverde/ExplosionVerde-4.png",
			"nubeverde/ExplosionVerde-5.png",
			"nubeverde/ExplosionVerde-6.png",
			"nubeverde/ExplosionVerde-7.png",
			"nubeverde/ExplosionVerde-8.png"
		])
		puntaje.puntaje(valorPuntosEnemigo)
		setup.removerEnemigos(self)
		animador.animarYRemover(self)
	}
}

class DragonRojo inherits Enemigo(
	image = "dragonrojo/DragonRojo-1.png",
	animador = new Animador(imagenes = [
		"dragonrojo/DragonRojo-1.png",
		"dragonrojo/DragonRojo-2.png",
		"dragonrojo/DragonRojo-3.png",
		"dragonrojo/DragonRojo-4.png",
		"dragonrojo/DragonRojo-5.png",
		"dragonrojo/DragonRojo-6.png",
		"dragonrojo/DragonRojo-7.png",
		"dragonrojo/DragonRojo-8.png"
	]),
	vidas = 1,
	valorPuntosEnemigo = 10
){}

class Moluscocerebro inherits Enemigo(
	image = "moluscocerebro/MoluscoCerebro-1.png",
	animador = new Animador(imagenes = [
		"moluscocerebro/MoluscoCerebro-1.png",
		"moluscocerebro/MoluscoCerebro-2.png",
		"moluscocerebro/MoluscoCerebro-3.png",
		"moluscocerebro/MoluscoCerebro-4.png"
	]),
	vidas = 2,
	valorPuntosEnemigo = 50
){}

class PajarosVerdes inherits Enemigo(
	image = "pajarosverdes/PajarosVerdes-1.png",
	animador = new Animador(imagenes = [
		"pajarosverdes/PajarosVerdes-1.png",
		"pajarosverdes/PajarosVerdes-2.png",
		"pajarosverdes/PajarosVerdes-3.png",
		"pajarosverdes/PajarosVerdes-4.png",
		"pajarosverdes/PajarosVerdes-5.png",
		"pajarosverdes/PajarosVerdes-6.png",
		"pajarosverdes/PajarosVerdes-7.png",
		"pajarosverdes/PajarosVerdes-8.png"
	]),
	vidas = 5 , valorPuntosEnemigo = 100)
{}
