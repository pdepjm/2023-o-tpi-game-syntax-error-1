import wollok.game.*
import bala.*
import nave.*
import animador.*
import setup.*
import puntaje.*
class Enemigo {
	const animador 
	const valorPuntosEnemigo
	var vidas 
	var property image 
	var property position
	
	method valorPuntosEnemigo() = valorPuntosEnemigo
	
	method animar() { animador.animar(self) }
	
	method vectorAJugador() {
		const dirX = nave.position().x() - self.position().x()
		const dirY = nave.position().y() - self.position().y()
		
		return new Position(x=dirX, y=dirY)
	}
	
	method spawn() {
		game.addVisual(self)
		setup.aniadirEnemigos(self)
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
		if(vecAJugador.y().abs() <= 1) self.morir()
		
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
  
  	method atacar() {
  		const vecAJugador = self.vectorAJugador()
  		
  		if(vecAJugador.x().abs() <= 10) {
			  const disparo = new Disparo(position = position.down(1), direccion = -1)
			  disparo.spawn()
		  }
  	}
  	
	method sufrirDanio(danio) {
  		if(vidas == 0) {
  			nave.matarEnemigo(self)
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
		"dragonrojo/DragonRojo-8.png",
		"dragonrojo/DragonRojo-9.png",
		"dragonrojo/DragonRojo-10.png",
		"dragonrojo/DragonRojo-11.png",
		"dragonrojo/DragonRojo-12.png",
		"dragonrojo/DragonRojo-13.png",
		"dragonrojo/DragonRojo-14.png",
		"dragonrojo/DragonRojo-15.png",
		"dragonrojo/DragonRojo-16.png",
		"dragonrojo/DragonRojo-17.png",
		"dragonrojo/DragonRojo-18.png",
		"dragonrojo/DragonRojo-17.png",
		"dragonrojo/DragonRojo-16.png",
		"dragonrojo/DragonRojo-15.png",
		"dragonrojo/DragonRojo-14.png",
		"dragonrojo/DragonRojo-13.png",
		"dragonrojo/DragonRojo-12.png"
		
	]),
	vidas = 1,
	valorPuntosEnemigo = 10
){
	override method atacar() {
  		const vecAJugador = self.vectorAJugador()
  		
  		if(vecAJugador.x().abs() <= 10) {
			  const disparo = new DisparoPotente(position = position.down(1), direccion = -1)
			  disparo.spawn()
		  }
  	}
}

class Terodactilo inherits Enemigo(
	image = "terodactilo/Terodactilo-1.png",
	animador = new Animador(imagenes = [
		"terodactilo/Terodactilo-1.png",
		"terodactilo/Terodactilo-2.png",
		"terodactilo/Terodactilo-3.png",
		"terodactilo/Terodactilo-4.png",
		"terodactilo/Terodactilo-5.png",
		"terodactilo/Terodactilo-6.png",
		"terodactilo/Terodactilo-7.png",
		"terodactilo/Terodactilo-8.png",
		"terodactilo/Terodactilo-9.png",
		"terodactilo/Terodactilo-10.png",
		"terodactilo/Terodactilo-11.png",
		"terodactilo/Terodactilo-12.png",
		"terodactilo/Terodactilo-13.png",
		"terodactilo/Terodactilo-14.png"
	]),
	vidas = 3,
	valorPuntosEnemigo = 35
){
	override method atacar() {
  		const vecAJugador = self.vectorAJugador()
  		
  		if(vecAJugador.x().abs() <= 10) {
			  const disparo = new DisparoDoble(position = position.down(1), direccion = -1)
			  disparo.spawn()
		  }
  	}
}

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
){
	override method atacar() {
  		const vecAJugador = self.vectorAJugador()
  		
  		if(vecAJugador.x().abs() <= 10) {
			  const disparo = new DisparoDividido(position = position.down(1), direccion = -1)
			  disparo.spawn()
		  }
  	}
}

class PajarosVerdes inherits Enemigo(
	image = "pajarosverdes/PajaroVerde-1.png",
	animador = new Animador(imagenes = [
		"pajarosverdes/PajaroVerde-1.png",
		"pajarosverdes/PajaroVerde-2.png",
		"pajarosverdes/PajaroVerde-3.png",
		"pajarosverdes/PajaroVerde-4.png",
		"pajarosverdes/PajaroVerde-5.png",
		"pajarosverdes/PajaroVerde-6.png",
		"pajarosverdes/PajaroVerde-7.png",
		"pajarosverdes/PajaroVerde-8.png",
		"pajarosverdes/PajaroVerde-9.png",
		"pajarosverdes/PajaroVerde-10.png",
		"pajarosverdes/PajaroVerde-11.png",
		"pajarosverdes/PajaroVerde-12.png",
		"pajarosverdes/PajaroVerde-13.png",
		"pajarosverdes/PajaroVerde-14.png",
		"pajarosverdes/PajaroVerde-15.png",
		"pajarosverdes/PajaroVerde-16.png",
		"pajarosverdes/PajaroVerde-17.png",
		"pajarosverdes/PajaroVerde-18.png",
		"pajarosverdes/PajaroVerde-19.png",
		"pajarosverdes/PajaroVerde-20.png",
		"pajarosverdes/PajaroVerde-21.png",
		"pajarosverdes/PajaroVerde-22.png",
		"pajarosverdes/PajaroVerde-23.png"
	]),
	vidas = 5 , valorPuntosEnemigo = 100)
{
	override method spawn() {
		super()
		game.onCollideDo(self, { visual =>
			if(visual.equals(nave)) {
				nave.sufrirDanio(1)
				self.morir()
			}
		})
	}
	
	override method atacar() {}

	override method seguirJugador(dirX,dirY) {
		const modulo = (dirX**2 + dirY**2).squareRoot() // para normalizar el vector
		
		self.position(game.at(self.position().x() + dirX/modulo, self.position().y() + dirY/modulo))
	}
}
	class Cruz inherits Enemigo(
	image = "cruz/Cruz-1.png",
	animador = new Animador(imagenes = [
		"cruz/Cruz-1.png",
		"cruz/Cruz-2.png",
		"cruz/Cruz-3.png",
		"cruz/Cruz-4.png",
		"cruz/Cruz-5.png"
	]),
	vidas = 1,
	valorPuntosEnemigo = 40
){
	var inmolacion = false
	override method spawn() {
		super()
		game.onCollideDo(self, { visual =>
			if(visual.equals(nave)) {
				nave.sufrirDanio(2)
				self.morir()
			}
		})
		game.schedule(2000,{inmolacion = true})
	}
	
	override method atacar() {}
	
	override method moverse() {
		var vecAJugador = self.vectorAJugador()
		const direccion = [
			position.right(1),
			position.left(1),
			position.down(1)
		]
		if(inmolacion){
			self.position(position.down(2))
		}else{
			self.position(direccion.anyOne())
		}
		self.evitarLimites()
		if(vecAJugador.y().abs() <= 1 or 
			position.x()<=0 or 
			position.x()>=game.width()
		) self.morir()
	}

}
