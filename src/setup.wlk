import wollok.game.*
import nave.*
import bala.*

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
	}

}

