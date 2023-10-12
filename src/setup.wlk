import wollok.game.*
import nave.*
import bala.*
import enemigo.*

object setup {
	const listaEnemigos = []
	
	method setup_board() {
		game.width(85)
		game.height(85)
		game.cellSize(10)
		game.title("Demon Attack")
		game.boardGround("fondo.png")
	}

	method setup_player() {
		game.addVisualCharacter(nave)
		nave.moverse()
	// keyboard.space().onPressDo{ nave.disparar()}
	}

	method setup_enemy() {
		game.onTick(10000, "invocar_enemigo", {
			const enemigo = new Enemigo(position=self.randomPos(0.1,0.90,0.60,0.45),energia=0)
			game.addVisual(enemigo)
			listaEnemigos.add(enemigo)
		})
		game.onTick(500, "mover_enemigo",{
			listaEnemigos.forEach({enemigo => enemigo.moverse()})	
		})
		game.onTick(350, "animar_enemigo", {
			listaEnemigos.forEach({enemigo => enemigo.animar()})
		})
	}
	
	// devuelve una posicion random dentro de los límites establecidos
	method randomPos(limStartX, limEndX, limStartY, limEndY) {
		const randXpos = (game.width() * limStartX).randomUpTo(game.width() * limEndX) 
		const randYpos = (game.height() * limStartY).randomUpTo(game.height() * limEndY)
		
		return game.at(randXpos,randYpos)
	}
}

