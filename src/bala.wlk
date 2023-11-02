import wollok.game.*
import nave.*
import enemigo.*
import setup.*
import animador.*

class Disparo {
	var property position
	var property image = "balas/balaV4-1.png"
	const animador = new Animador (imagenes = [
		"balas/balaV4-1.png",
		"balas/balaV4-2.png",
		"balas/balaV4-3.png",
		"balas/balaV4-4.png"
	])
	var direccion
	var danio = 1
	
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


class DisparoPotente inherits Disparo(image= "balas/balaV1-1.png",
	animador = new Animador(imagenes = [
		"balas/balaV1-1.png",
		"balas/balaV1-2.png",
		"balas/balaV1-3.png",
		"balas/balaV1-4.png"
	]),
	danio= 2
) {}

class DisparoDoble inherits Disparo(image= "balas/balaV2-1.png",
	animador = new Animador(imagenes = [
		"balas/balaV2-1.png",
		"balas/balaV2-2.png",
		"balas/balaV2-3.png",
		"balas/balaV2-4.png"
	]),
	danio= 1
) {
	override method habilidad() {
		game.schedule(110,{
			  	const disparo = new Disparo(position = position.down(1), direccion = -1, animador=animador)
			  	disparo.spawn()
			  })
	}
}

class DisparoDividido inherits Disparo(image= "balas/balaV3-1.png",
		animador = new Animador(imagenes = [
		"balas/balaV3-1.png",
		"balas/balaV3-2.png",
		"balas/balaV3-3.png",
		"balas/balaV3-4.png",
		"balas/balaV3-5.png"
	])
) {
	override method habilidad() {
		const disparoIzq = new Disparo(position= self.position().left(1), direccion= direccion, animador=animador)
		const disparoDer = new Disparo(position= self.position().right(1), direccion= direccion, animador=animador)
		
		disparoIzq.spawn()
		disparoDer.spawn()
	}
}