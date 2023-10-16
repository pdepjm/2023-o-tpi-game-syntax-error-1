import wollok.game.*
import disparo.*
class Enemigo {

	var property energia 
	var property vidas = 3
	var property disparo = null

	var posX = 0
	var posY = 30

	var property position

	const color = ["verde","amarillo","rojo"]
	
	method energia()=energia
	method energia(nuevaEnergia){energia = nuevaEnergia}
	
	method vidas() = vidas
	method vidas(nuevoValor){vidas = nuevoValor}
	
	
	method perderEnergia (){

 }

	method image() = "nave/nave.png"

	method perderVida() {
		vidas = vidas - 1
		if (vidas == 0) {
			self.morir()
		}
	}


	method moverse() {
	}

	method disparar() {
		
		if(disparo == null || !game.hasVisual(disparo)){
			disparo = new Disparo(position = position.left(1).down(1), direccion= -1 )			
			game.addVisual(disparo)		
		}	  
	}

	method morir() {
		game.removeVisual(self)
	}

}





