import wollok.game.*
import setup.*

class Animador {
	var fuente 
	var index = 0
	var cantidad
	var extension
	
	method fuente(nuevaFuente) { fuente = nuevaFuente }
	method cantidad(nuevaCantidad) { cantidad = nuevaCantidad }
	method extension(nuevaExtension) { extension = nuevaExtension }
	
	method animar(objeto) {
		objeto.image(fuente + self.siguiente() + extension)
	}
	
	method animarYRemover(objeto) {
		var vez = 0
		game.onTick(125, "muerte_enemigo", {
			self.animar(objeto)
			if(vez >= cantidad){
				if(game.hasVisual(objeto)) game.removeVisual(objeto)
				game.removeTickEvent("muerte_enemigo")
			}
			vez = vez + 1		
		})
	}

	method siguiente(){
		if (index < cantidad){
			index = index + 1
			return index
		}
		index=0
		return index
	}
	
 }