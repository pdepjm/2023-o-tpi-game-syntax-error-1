import wollok.game.*
import nave.*
import enemigo.*
import setup.*

class Disparo {
	var property position
	const property image = "balaA.png"
	var direccion
	var danio = 1
	
	method spawn() {
		game.addVisual(self)
		setup.aniadirDisparos(self)
		game.onCollideDo(self, {visual =>
			if(game.hasVisual(visual)) visual.sufrirDanio(danio)
			self.eliminarDisparo()	
		})
		game.schedule(50, {
			self.habilidad()
		})
	}
	
	method habilidad() {}
	
	method sufrirDanio(_danio) {}
	
	method mover(){
		self.position(position.up(direccion))
	}
	
	method eliminarDisparo(){
		if(game.hasVisual(self)) {
			setup.removerDisparos(self)
			game.removeVisual(self)
		}
	}
}

class DisparoPotente inherits Disparo(image= "balaA.png", danio= 2) {}

class DisparoDividido inherits Disparo(image= "balaA.png") {
	override method habilidad() {
		const disparoIzq = new Disparo(position= self.position().left(1), direccion= direccion)
		const disparoDer = new Disparo(position= self.position().right(1), direccion= direccion)
		
		disparoIzq.spawn()
		disparoDer.spawn()
	}
}