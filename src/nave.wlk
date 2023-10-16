import wollok.game.*
import disparo.*
import sonido.*
import setup.*
object nave {
	var property position = game.at(game.width()/2,0)
	method image() = "nave1.png"
	method disparar(disparo){
		if( !game.hasVisual(disparo)){
			soundProducer.sound("disparo.wav").play()			
			game.addVisual(disparo)	
			
		}	  

	}
	method moverse() {
		keyboard.a().onPressDo({ self.position(position.left(1))})
		keyboard.d().onPressDo({ self.position(position.right(1))})
	}

	

}
