import wollok.game.*
import nave.*
import setup.*
//import enemigo.*

class Disparo {
	var property position
	const property image = "prueba_bala.png"
	var direccion
	var danio = 1
	
	method spawn() {
		game.addVisual(self)
		setup.aniadirDisparos(self)
		game.onCollideDo(self, {enemigo =>
			if(game.hasVisual(enemigo)) self.daniar(enemigo)
			self.eliminarDisparo()	
		})
		game.schedule(90, {
			self.habilidad()
		})
	}
	
	method habilidad() {}
	
	method daniar(visual) {
		visual.vidas(visual.vidas() - self.danio())
		
		if(visual.vidas() <= 0) {
			visual.morir()
		}
	}

	method mover(){
		self.position(position.up(direccion))
	}
	
	method danio() = danio
	
	method eliminarDisparo(){
		setup.removerDisparos(self)
		game.removeVisual(self)
	}
}

class DisparoPotente inherits Disparo(image= "prueba_bala.png") {
	override method danio() = 2
}

class DisparoDividido inherits Disparo(image= "prueba_bala.png") {
	override method habilidad() {
		const disparoIzq = new Disparo(position= self.position().left(2), direccion= direccion)
		const disparoDer = new Disparo(position= self.position().right(2), direccion= direccion)
		
		disparoIzq.spawn()
		disparoDer.spawn()
	}
}