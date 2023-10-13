import wollok.game.*

class Animador {
	var imagenes 
	var index = 1
	
	method imagenes(imgs) {
		imagenes = imgs
	}
	
	method animar(objeto) {
		objeto.image(self.siguiente())
		index = index + 1
	}
	
	method animarYRemover(objeto) {
		var vez = 0
		game.onTick(150, "muerte_enemigo", {
			self.animar(objeto)
			vez = vez + 1
			if(vez >= imagenes.size()){
				game.removeTickEvent("muerte_enemigo")
				game.removeVisual(objeto)
			}		
		})
	}

	method siguiente() {
		try {
			return imagenes.get(index) 	
		}
		catch error {
			index = 0
			return imagenes.get(index)
		}		
	}
	
	method imagenInicial() = imagenes.get(0) 
}
