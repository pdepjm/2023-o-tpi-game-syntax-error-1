import wollok.game.*
import setup.*

class Animador {
	var direccion 
	var index = 0
	var cantidad
	var extension
	
	
	method animar(objeto) {
			objeto.image(direccion + self.siguiente()+ extension)
	}
	method animarMuerteEnemigoyRemover(objeto){
		direccion = "nubeverde/ExplosionVerde-"
		cantidad = 8
		extension = ".png"
		game.onTick(150,"muerte_enemigo",{self.animar(objeto)
			game.schedule(700,{if(game.hasVisual(objeto)){
				game.removeVisual(objeto) game.removeTickEvent("muerte_enemigo") setup.removerEnemigos(objeto)
			}})
		})
	
	}
	
	method animarMuerteNaveyRemover(objeto){
		direccion = "explosion/Explosion-"
		cantidad = 8
		extension = ".png"
		game.onTick(150,"muerte_nave",{self.animar(objeto)
			game.schedule(700,{if(game.hasVisual(objeto)){
				game.removeVisual(objeto) game.removeTickEvent("muerte_nave") 
			}})
		})
	}

	method siguiente(){
		if (index<cantidad){
			index = index + 1
			return index
			}
			index=0
			return index
	}
	
 }