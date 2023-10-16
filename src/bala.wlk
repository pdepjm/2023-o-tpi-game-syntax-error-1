import wollok.game.*
import nave.*

class Disparo{
	var property position
	var direccion
	const property image = "bala.png"
	method position(posicion){
		position = posicion
	}
	method mover(){
		position = position.up(direccion)
	}
	method eliminarDisparo(){
		if( game.hasVisual(self)){
					game.removeVisual(self)
					game.removeTickEvent("expiraBala")
					game.removeTickEvent("moverBala")
				}
	}
	
}

