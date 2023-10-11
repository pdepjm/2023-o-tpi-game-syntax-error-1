import wollok.game.*
import bala.*

class enemigo {
	
	var property energia
	var property vidas = 3
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
		vidas = vidas - 1
		if (vidas==0){self.morir()}	
	}
	
	method perderEnergia(){

	}
	method inicializar(){	
	}
	method moverse() {
	}
	method disparar(){
	}
	method morir(){
		game.removeVisual(self)
        
	}
	
	
}

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
		