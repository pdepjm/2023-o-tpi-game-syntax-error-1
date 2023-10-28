import wollok.game.*
import nave.*
import enemigo.*
import setup.*

class Disparo {
	var property position
	const property image = "prueba_bala.png"
	var direccion
	var danio = 1
	
	method spawn() {
		game.addVisual(self)
		setup.aniadirDisparos(self)
		game.onCollideDo(self, {visual =>
			if(game.hasVisual(visual)) visual.sufrirDanio(danio)
			self.eliminarDisparo()	
		})
		game.schedule(110, {
			self.habilidad()
		})
	}
	
	method habilidad() {}
	
	method sufrirDanio(_danio) {}
	
	method mover(){
		self.position(position.up(direccion))
	}
	
	method eliminarDisparo(){
		setup.removerDisparos(self)
		game.removeVisual(self)
	}
}

class DisparoPotente inherits Disparo(image= "prueba_bala.png", danio= 2) {}

class DisparoDividido inherits Disparo(image= "prueba_bala.png") {
	override method habilidad() {
		const disparoIzq = new Disparo(position= self.position().left(2), direccion= direccion)
		const disparoDer = new Disparo(position= self.position().right(2), direccion= direccion)
		
		disparoIzq.spawn()
		disparoDer.spawn()
	}
}