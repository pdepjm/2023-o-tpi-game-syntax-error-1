import wollok.game.*

class Animador {
	var imagenes 
	var index = 0
	
	method imagenes(imgs) {
		imagenes = imgs
	}
	
	method animar(objeto) {
		objeto.image(self.siguiente())
	}
	
	method animarYRemover(objeto) {
		var vez = 0
		game.onTick(150, "muerte_enemigo", {
			self.animar(objeto)
			if(vez >= imagenes.size()){
				if(game.hasVisual(objeto)) game.removeVisual(objeto)
				game.removeTickEvent("muerte_enemigo")
			}
			vez = vez + 1		
		})
	}
	
	method siguiente() {
		index = index + 1
		try {
			return imagenes.get(index) 	
		}
		catch error {
			index = 0
			return imagenes.get(index)
		}		
	}
}