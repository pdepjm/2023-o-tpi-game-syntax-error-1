import wollok.game.*
import animador.*
import sonido.*
import bala.*

object nave {
	//var vidas = 3
	var indiceMovimiento
	var property position = game.at(game.width()/2,0)
	const animador = new Animador(imagenes=[
		"explosion/Explosion-12.png",
		"explosion/Explosion-11.png",
		"explosion/Explosion-10.png",
		"explosion/Explosion-09.png",
		"explosion/Explosion-08.png",
		"explosion/Explosion-07.png",
		"explosion/Explosion-06.png",
		"explosion/Explosion-05.png",
		"explosion/Explosion-04.png",
		"explosion/Explosion-03.png",
		"explosion/Explosion-02.png",
		"explosion/Explosion.png"
	])

	var property image = "nave1.png"
	
	
	
	const imagenes_animacion = [
		"movimientoNave/movimientoNave-1.png",
		"movimientoNave/movimientoNave-2.png",
		"movimientoNave/movimientoNave-3.png",
		"movimientoNave/movimientoNave-4.png",
		"movimientoNave/movimientoNave-5.png",
		"movimientoNave/movimientoNave-6.png",
		"movimientoNave/movimientoNave-7.png",
		"movimientoNave/movimientoNave-8.png",
		"movimientoNave/movimientoNave-9.png",
		"movimientoNave/movimientoNave-10.png",
		"movimientoNave/movimientoNave-11.png",
		"movimientoNave/movimientoNave-12.png",
		"movimientoNave/movimientoNave-13.png"
		]
		
	method moverse() {
		keyboard.a().onPressDo({self.moverse("izquierda")})
		keyboard.d().onPressDo({self.moverse("derecha")})
	}
	
  
  	method disparar(){	
	  		const disparo = new Disparo( position = self.position().up(1), direccion = 1)
	  		game.addVisual(disparo)
	  		disparo.spawn()
		  	soundProducer.sound("disparo.wav").play()					
  	}
  	
  	method moverse(direccion){
  		if (direccion == "derecha"){
  			indiceMovimiento = 0
  			image = imagenes_animacion.get(indiceMovimiento)
  			game.onTick(1,"moverseDerecha",{
  				self.image(self.siguiente())
  			})
  		 }else{
  			indiceMovimiento = 12
  			image = imagenes_animacion.get(indiceMovimiento)
  			game.onTick(1,"moverseIzquierda",{
  				self.image(self.anterior())
  			})
  			self.position(position.left(1))
  		}
  	}
  	
  	method siguiente() {
		if (indiceMovimiento < 12){
		indiceMovimiento = indiceMovimiento + 1	
		imagenes_animacion.get(indiceMovimiento)
		return(imagenes_animacion.get(indiceMovimiento))
		}else{
			game.removeTickEvent("moverseDerecha")
			self.position(position.right(1)) 
			return("nave1.png")
		}
		}
	
	method anterior() {
		if (indiceMovimiento > 0){
		indiceMovimiento = indiceMovimiento - 1	
		imagenes_animacion.get(indiceMovimiento)
		return(imagenes_animacion.get(indiceMovimiento))
		}else{
			game.removeTickEvent("moverseIzquierda")
			return("nave1.png")
		}
	}
  	
  	/*method sufrirDanio() {
  		vidas = vidas - 1
  		
  		if(vidas <= 0) {
  			self.morir()
  		}
  	}*/
	
	method morir() {
		animador.animarYRemover(self)
	}
}
