class Animador {
	var imagenes 
	var index = 1
	
	method animar(objeto) {
		objeto.image(self.siguiente())
		index = index + 1
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
