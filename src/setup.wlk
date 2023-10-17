import wollok.game.*
import nave.*
import disparo.*
import enemigo.*

object setup {
	const listaEnemigos = []
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
	    	game.onCollideDo(disparo, {enemigo =>
			disparo.eliminarDisparo()
			disparos.remove(disparo)
			game.removeVisual(enemigo)
				
			})
	    	game.onTick(10,"moverBala",{disparos.forEach{bala=> bala.mover()}}) 
	    	disparos.add(disparo)
	    	game.onTick(600,"expiraBala",{
	    		disparos.remove(disparo)
	    		disparo.eliminarDisparo()
	    	})
	    }
	}

	method setup_enemy() {
		 game.onTick(10000, "invocar_enemigo", {
			const enemigo = new Enemigo(position=self.randomPos(0.1,0.9,0.60,0.45),energia=0)
			game.addVisual(enemigo)
			listaEnemigos.add(enemigo)
		})
		game.onTick(600, "mover_enemigo",{
			listaEnemigos.forEach({enemigo => enemigo.moverse()})	
		})
		game.onTick(200, "animar_enemigo", {
			listaEnemigos.forEach({enemigo => enemigo.animador().animar(enemigo)})
		})
		game.onCollideDo(enemigo, { 
			if(enemigo.vidas() == 0) {
				enemigo.morir()
				listaEnemigos.remove(enemigo)
			}else {
				enemigo.vida(-1)
			}
		})
	}
  
	method setupBala() {
		if(!disparos.isEmpty()){
			}
	}

	// devuelve una posicion random dentro de los límites establecidos
	method randomPos(limStartX, limEndX, limStartY, limEndY) {
		const randXpos = (game.width() * limStartX).randomUpTo(game.width() * limEndX) 
		const randYpos = (game.height() * limStartY).randomUpTo(game.height() * limEndY)
		
		return game.at(randXpos,randYpos)
	}
}

