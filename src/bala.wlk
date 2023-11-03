import wollok.game.*
import nave.*
import enemigo.*
import setup.*
import animador.*

class Disparo {
	var property position
	var property image = "balas/balaV4-0.png"
	const animador = new Animador (fuente="balas/balaV4-",cantidad=3,extension=".png")
	var direccion
	const danio = 1
	
	method animar() { animador.animar(self) }
	
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
	
	method moverse(){
		self.position(position.up(direccion))
	}
	
	method eliminarDisparo(){
		if(game.hasVisual(self)) {
			setup.removerDisparos(self)
			game.removeVisual(self)
		}
	}
}

class DisparoPotente inherits Disparo(image= "balas/balaV1-0.png",
	animador = new Animador(fuente="balas/balaV1-",cantidad=3,extension=".png"),
	danio= 2
) {}

class DisparoDoble inherits Disparo(image= "balas/balaV2-0.png",
	animador = new Animador(fuente="balas/balaV2-",cantidad=3,extension=".png"),
	danio= 1
) {
	override method habilidad() {
		game.schedule(110,{
			new Disparo(position = position.down(1), direccion = -1, animador= animador).spawn()
		})
	}
}

class DisparoDividido inherits Disparo(image= "balas/balaV3-0.png",
		animador = new Animador(fuente="balas/balaV3-",cantidad=4,extension=".png")
) {
	override method habilidad() {
		new Disparo(position= self.position().left(1), direccion= direccion, animador= animador).spawn()
		new Disparo(position= self.position().right(1), direccion= direccion, animador= animador).spawn()
	}
}
