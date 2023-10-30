import wollok.game.*
import nave.*
import bala.*
import enemigo.*
import animador.*
import puntaje.*

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
		game.width(20)
		game.height(15)
		game.cellSize(60)
		game.title("Demon Attack")
		game.boardGround("fondo.png")
	}
	
	method setupPlayer() {
		game.addVisual(nave)
		nave.moverse()
    	keyboard.space().onPressDo{nave.disparar()}
	}	
	
	method setupEnemy() {
		const invoc_enemigos = [
			{new DragonRojo(position=self.randomPos(0.1,0.9,0.70,0.45))},
			{new Moluscocerebro(position=self.randomPos(0.1,0.9,0.70,0.45))},
			{new PajarosVerdes(position=self.randomPos(0.1,0.9,0.70,0.45))},
			{new Terodactilo(position=self.randomPos(0.1,0.9,0.70,0.45))}
		]
		game.onTick(7000, "invocar_enemigo", {
			const enemigo = invoc_enemigos.anyOne().apply()
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
		game.onTick(55,"moverBala", {disparos.forEach{bala => 
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
