import wollok.game.*
import nave.*
import bala.*
import enemigo.*

object setup {
	const enemigos = []
	const disparos = []
	
	method aniadirDisparos(disparo) {
		disparos.add(disparo)
	}
	
	method removerDisparos(disparo) {
		disparos.remove(disparo)
	}
	
	method removerEnemigos(enemigo) {
		enemigos.remove(enemigo)
	}
  	
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
    	keyboard.space().onPressDo{nave.disparar()}
	}	
	
	method setupEnemy() {
		game.onTick(4000, "invocar_enemigo", {
			const enemigo = new Enemigo(position=self.randomPos(0.1,0.9,0.60,0.45))
			game.addVisual(enemigo)
			enemigos.add(enemigo)
		})
		game.onTick(750, "mover_enemigo",{
			enemigos.forEach({enemigo => enemigo.moverse()})	
		})
		game.onTick(200, "animar_enemigo", {
			enemigos.forEach({enemigo => enemigo.animador().animar(enemigo)})
		})
	}
  	
	method setupBala() {
		game.onTick(10,"moverBala", {disparos.forEach{bala => 
			if(!disparos.isEmpty()) {
				bala.mover()
				if(bala.position().y().abs() >= game.height()) bala.eliminarDisparo() 			
			}
		}})
	}
	
	// devuelve una posicion random dentro de los límites establecidos
	method randomPos(limStartX, limEndX, limStartY, limEndY) {
		const randXpos = (game.width() * limStartX).randomUpTo(game.width() * limEndX) 
		const randYpos = (game.height() * limStartY).randomUpTo(game.height() * limEndY)
		
		return game.at(randXpos,randYpos)
	}
}