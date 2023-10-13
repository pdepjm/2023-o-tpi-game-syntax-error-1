import wollok.game.*
import animador.*

object nave {
	var property position = game.at(game.width()/2,0)
	const animador = new Animador(imagenes=[
		"explosion/Explosion-12.png",
		"explosion/Explosion-11.png",
		"explosion/Explosion-10.png",
		"explosion/Explosion-09.png",
		"explosion/Explosion-08.png",
		"explosion/Explosion-07.png",
		"explosion/Explosion-06.png",
		"explosion/Explosion-05.png",
		"explosion/Explosion-04.png",
		"explosion/Explosion-03.png",
		"explosion/Explosion-02.png",
		"explosion/Explosion.png"
	])

	var property image = "nave1.png"

	method moverse() {
		keyboard.a().onPressDo({self.position(position.left(1))})
		keyboard.d().onPressDo({self.position(position.right(1))})
	}
	
	method morir() {
		animador.animarYRemover(self)
	}
}

