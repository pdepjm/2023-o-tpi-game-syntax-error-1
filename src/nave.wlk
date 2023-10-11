import wollok.game.*

object nave {

	var property position = game.at(game.width()/2,0)

	method image() = "nave1.png"

	method moverse() {
		keyboard.a().onPressDo({ self.position(position.left(1))})
		keyboard.d().onPressDo({ self.position(position.right(1))})
	}

// method disparar() {
// const miPos = self.position().up(1).right(1)
// game.addVisual(bala)
// bala.position(miPos)
// game.onTick(25, "Disparo", { bala.subir()})
//}
}

