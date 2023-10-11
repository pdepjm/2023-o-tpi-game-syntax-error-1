import wollok.game.*

object enemigo {
	
	var property energia
	var property vidas = 3
	var posX = 0
	var posY =0
	
	var property image
	var property position 
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
