import wollok.game.*
import nave.*
import setup.*
import enemigo.*

class Disparo{
	var property position
	const property image = "prueba_bala.png"
	var direccion
	
	method spawn() {
		setup.aniadirDisparos(self)
		game.onCollideDo(self, {enemigo =>
			if(game.hasVisual(enemigo)) enemigo.sufrirDanio()
			self.eliminarDisparo()	
		})
	}

	method mover(){
		self.position(position.up(direccion))
	}
	
	method eliminarDisparo(){
		setup.removerDisparos(self)
		game.removeVisual(self)
	}
}