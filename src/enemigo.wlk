import wollok.game.*
import bala.*

<<<<<<< HEAD
class enemigo {
	
	var property energia
=======
class Enemigo {

	// var property energia
>>>>>>> branch 'master' of https://github.com/pdepjm/2023-o-tpi-game-syntax-error-1.git
	var property vidas = 3
<<<<<<< HEAD
	var posX = 0.upTo()
	var posY = 30
	
	const image = 
	var property position = 
	const color = ["verde","amarillo","rojo"]
	
	method energia()=energia
	method energia(nuevaEnergia){energia = nuevaEnergia}
	
	method vidas() = vidas
	method vidas(nuevoValor){vidas = nuevoValor}
	
	
	method perderVida (){
=======
	var property position
	const color = [ "verde", "amarillo", "rojo" ]

	// method energia() = energia
	// method energia(nuevaEnergia) {
	// energia = nuevaEnergia
	// }
	method vidas(nuevoValor) {
		vidas = nuevoValor
	}

	method image() = "nave1.png"

	method perderVida() {
>>>>>>> branch 'master' of https://github.com/pdepjm/2023-o-tpi-game-syntax-error-1.git
		vidas = vidas - 1
		if (vidas == 0) {
			self.morir()
		}
	}
<<<<<<< HEAD
	
	method perderEnergia(){

=======

	method perderEnergia() {
>>>>>>> branch 'master' of https://github.com/pdepjm/2023-o-tpi-game-syntax-error-1.git
	}

	method moverse() {
	}

	method disparar() {
	}

	method morir() {
		game.removeVisual(self)
	}

}

<<<<<<< HEAD
class Enemy {
	const property image
	const posicionInicial
	var property position 
	
	
	

	
	
	constructor(posicionInicial, _imagen) {
		image = _imagen
		_posicionInicial = posicionInicial
		position = posicionInicial
	}
	
	method soltar() { 
		position = _posicionInicial
	}
	

}



/*
	(1 .. ancho-1).forEach { n => arbustoFactory.draw(new ArbustoAbajo(),new Position(x=n, y=0)) } // bordeAbajo
	(1 .. ancho-1).forEach { n => arbustoFactory.draw(new ArbustoArriba(), new Position(x=n, y=largo)) } // bordeArriba 
	(0 .. largo).forEach { n => arbustoFactory.draw(new ArbustoIzquierda(), new Position(x=0, y=n)) } // bordeIzq 
	(0 .. largo).forEach { n => arbustoFactory.draw(new ArbustoDerecha(), new Position(x=ancho, y=n)) } // bordeDer
 */ 
		
=======
>>>>>>> branch 'master' of https://github.com/pdepjm/2023-o-tpi-game-syntax-error-1.git
