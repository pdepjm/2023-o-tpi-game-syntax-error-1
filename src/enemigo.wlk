import wollok.game.*

class Enemigo {

	// var property energia
	var property vidas = 3
	var property position
	const color = [ "verde", "amarillo", "rojo" ]

	// method energia() = energia
	// method energia(nuevaEnergia) {
	// energia = nuevaEnergia
	// }
	method vidas(nuevoValor) {
		vidas = nuevoValor
	}

	method image() = "nave1.png"

	method perderVida() {
		vidas = vidas - 1
		if (vidas == 0) {
			self.morir()
		}
	}

	method perderEnergia() {
	}

	method moverse() {
	}

	method disparar() {
	}

	method morir() {
		game.removeVisual(self)
	}

}

