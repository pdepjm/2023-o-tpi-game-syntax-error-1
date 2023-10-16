import wollok.game.*
import nave.*
import disparo.*
import enemigo.*

object setup {
	var property enemigos = []
	const disparos = []
	method setupBoard() {
		game.width(50)
		game.height(40)
		game.cellSize(20)
		game.title("Demon Attack")
		game.boardGround("fondo.png")
	}

	method setupPlayer() {
		game.addVisual(nave)
		nave.moverse()
	    keyboard.space().onPressDo{ const disparo = new Disparo( position = nave.position().right(1).up(1), direccion = 1) 
	    	nave.disparar(disparo)
	    	game.onCollideDo(disparo, {const enemigo = game.uniqueCollider(disparo)
	    	//game.say(enemigo,"memori")
			//disparos.remove(disparo)
			//enemigos.remove(enemigo)
			//game.removeVisual(enemigo)
			
			//disparo.eliminarDisparo()	
			})
	    	game.onTick(10,"moverBala",{disparos.forEach{bala=> bala.mover()}}) 
	    	disparos.add(disparo)
	    	game.onTick(600,"expiraBala",{
	    		disparos.remove(disparo)
	    		disparo.eliminarDisparo()
	    	})
	    }
	    
		
	}

	method setupEnemy() {
		enemigos = [game.onTick(5000,"invocar_enemigo",{game.addVisual(new Enemigo(position=self.randomPos(0.1,0.90,0.80,0.45), energia = 100))})]
		
	}
	method setupBala() {
		if(!disparos.isEmpty()){
			}
	}


	
	// devuelve una posicion random dentro de los límites establecidos
	method randomPos(limStartX, limEndX, limStartY, limEndY) {
		const randXpos = (game.width()*limStartX).randomUpTo(game.width()*limEndX) 
		const randYpos = (game.height()*limStartY).randomUpTo(game.height()*limEndY)
		
		return game.at(randXpos,randYpos)
	}
}

