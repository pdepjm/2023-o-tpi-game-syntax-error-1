import wollok.game.*
import nave.*
import bala.*
import enemigo.*
import animador.*

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
		game.onTick(5000, "invocar_enemigo", {
			const enemigo = new DragonRojo(position=self.randomPos(0.1,0.9,0.60,0.45))
			game.addVisual(enemigo)
			enemigos.add(enemigo)
		})
		game.onTick(750, "mover_enemigo",{
			enemigos.forEach({enemigo => enemigo.moverse()})	
		})
		game.onTick(200, "animar_enemigo", {
			enemigos.forEach({enemigo => enemigo.animador().animar(enemigo)})
		})
		game.onTick(2000, "disparar_enemigo", {
			enemigos.forEach({enemigo => enemigo.disparar()})
		})
	}
	
	method setupBala() {
		game.onTick(15,"moverBala", {disparos.forEach{bala => 
			if(!disparos.isEmpty()) {
				if(bala.position().y() >= game.height()*0.7 or bala.position().y() <= 0) 
					bala.eliminarDisparo() 
				
				bala.mover() 			
			}
		}})
	}
	
	// devuelve una posicion random dentro de los límites establecidos
	method randomPos(limInicioX, limFinalX, limInicioY, limFinalY) {
		const randXpos = (game.width() * limInicioX).randomUpTo(game.width() * limFinalX) 
		const randYpos = (game.height() * limInicioY).randomUpTo(game.height() * limFinalY)
		
		return game.at(randXpos,randYpos)
	}
}
