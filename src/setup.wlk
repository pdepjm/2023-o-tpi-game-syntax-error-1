import wollok.game.*
import nave.*
import bala.*
import enemigo.*

object setup {
	method setup_board() {
		game.width(50)
		game.height(40)
		game.cellSize(20)
		game.title("Demon Attack")
		game.boardGround("fondo.png")
	}

	method setup_player() {
		game.addVisualCharacter(nave)
		nave.moverse()
	// keyboard.space().onPressDo{ nave.disparar()}
	}

	method setup_enemy() {
		game.onTick(5000, "invocar_enemigo", {
			game.addVisual(new Enemigo(position=self.randomPos(0.1,0.90,0.80,0.45)))
		})
	}
	
	// devuelve una posicion random dentro de los límites establecidos
	method randomPos(limStartX, limEndX, limStartY, limEndY) {
		const randXpos = (game.width()*limStartX).randomUpTo(game.width()*limEndX) 
		const randYpos = (game.height()*limStartY).randomUpTo(game.height()*limEndY)
		
		return game.at(randXpos,randYpos)
	}
}

