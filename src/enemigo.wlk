import wollok.game.*
import bala.*
import nave.*
import animador.*
import setup.*
import puntaje.*
class Enemigo {
	var animador  
	const valorPuntosEnemigo
	var vidas 
	var property image 
	var property position
	
	method animar() { animador.animar(self) }
	
	method vectorAJugador() {
		const dirX = nave.position().x() - self.position().x()
		const dirY = nave.position().y() - self.position().y()
		
		return new Position(x=dirX, y=dirY)
	}
	
	method valorPuntosEnemigo() = valorPuntosEnemigo
	
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
			  new Disparo(position = position.down(1), direccion = -1).spawn()
		  }
  	}
  	
	method sufrirDanio(danio) {
  		if(vidas == 0) {
  			nave.matar(self)
  		}else {
  			vidas = vidas - danio
  		}
  	}

	method morir() {
		animador.fuente("nubeverde/ExplosionVerde-")
		animador.cantidad(7)
		animador.extension(".png")
		setup.removerEnemigos(self)
		animador.animarYRemover(self)
	}
}

class DragonRojo inherits Enemigo(
	image = "dragonrojo/DragonRojo-0.png",
	animador = new Animador(fuente="dragonrojo/DragonRojo-",cantidad=7,extension=".png"),
	vidas = 1,
	valorPuntosEnemigo = 10
){}

class Terodactilo inherits Enemigo(
	image = "terodactilo/Terodactilo-0.png",
	animador = new Animador(fuente="terodactilo/Terodactilo-",cantidad =13,extension=".png"),
	vidas = 3,
	valorPuntosEnemigo = 35
){
	override method atacar() {
  		const vecAJugador = self.vectorAJugador()
  		
  		if(vecAJugador.x().abs() <= 10) {
			new DisparoDoble(position = position.down(1), direccion = -1).spawn()
		}
  	}
}

class Moluscocerebro inherits Enemigo(
	image = "moluscocerebro/MoluscoCerebro-0.png",
	animador = new Animador(fuente="moluscocerebro/MoluscoCerebro-",cantidad = 3,extension=".png"),
	vidas = 2,
	valorPuntosEnemigo = 50
){
	override method atacar() {
  		const vecAJugador = self.vectorAJugador()
  		
  		if(vecAJugador.x().abs() <= 10) {
			  new DisparoDividido(position = position.down(1), direccion = -1).spawn()
		}
  	}
}

class PajarosVerdes inherits Enemigo(
	image = "pajarosverdes/PajaroVerde-0.png",
	animador = new Animador(fuente="pajarosverdes/PajaroVerde-",cantidad=22,extension=".png"),
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
	animador = new Animador(fuente="cruz/Cruz-",cantidad=5,extension=".png"),
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
		game.schedule(2000,{ inmolacion = true })
	}
	
	override method atacar() {}
	
	override method moverse() {
		const vecAJugador = self.vectorAJugador()
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