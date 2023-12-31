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
	
	method enemigos() = enemigos
	method aniadirEnemigos(enemigo) {
		enemigos.add(enemigo)
	}
	method removerEnemigos(enemigo) {
		enemigos.remove(enemigo)
	}
  	
	method setupBoard() {
		game.width(20)
		game.height(13)
		game.cellSize(60)
		game.title("Demon Attack")
		game.boardGround("fondo.png")
	}
	
	method setupJugador() {
		nave.spawn()
	}
	
	method setupEnemigo(intervalo) {
		const invoc_enemigos = [
			{new DragonRojo(position=self.randomPos(0.1,0.9,0.70,0.45))},
			{new Moluscocerebro(position=self.randomPos(0.1,0.9,0.70,0.45))},
			{new PajarosVerdes(position=self.randomPos(0.1,0.9,0.70,0.45))},
			{new Cruz(position=self.randomPos(0.1,0.9,0.70,0.45))},
			{new Terodactilo(position=self.randomPos(0.1,0.9,0.70,0.45))}
		]

		game.onTick(intervalo, "invocar_enemigo", {
			invoc_enemigos.anyOne().apply().spawn()
		})
		game.onTick(750, "mover_enemigo",{
			enemigos.forEach({enemigo => enemigo.moverse()})	
		})
	}
	
	method setupDisparos() {
		game.onTick(2000, "disparar_enemigo", {
			enemigos.forEach({enemigo => enemigo.atacar()})
		})
		game.onTick(110,"moverBala", {disparos.forEach{bala => 
			if(!disparos.isEmpty()) {
				if(bala.position().y() >= game.height()*0.7 or bala.position().y() <= 0) 
					bala.eliminarDisparo() 
				
				bala.moverse() 			
			}
		}})
	}
	
	method setupAnimacion() {
		game.onTick(150, "animar_enemigo", {
			enemigos.forEach({enemigo => enemigo.animar()})
		})
		game.onTick(50, "animar_bala", {
			disparos.forEach({bala => bala.animar()})
		})
	}
	
	method reiniciar(){
		nave.reiniciar()
		puntaje.reiniciar()
	}
	
	method setupPuntajeDigital() {
		//game.addVisual(miles)
		game.addVisual(centenas)
		game.addVisual(decenas)
		game.addVisual(unidades)
	}
	
	method gameClear() {
		game.clear()
		enemigos.clear()
		disparos.clear()
	}
	
	// devuelve una posicion random dentro de los límites establecidos
	method randomPos(limInicioX, limFinalX, limInicioY, limFinalY) {
		const randXpos = (game.width() * limInicioX).randomUpTo(game.width() * limFinalX) 
		const randYpos = (game.height() * limInicioY).randomUpTo(game.height() * limFinalY)
		
		return game.at(randXpos,randYpos)
	}
}
