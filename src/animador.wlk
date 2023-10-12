class Animador {
	var imagenes 
	var index = 1
	
	method animar(objeto) {
		objeto.image(self.siguiente())
		index = index + 1
	}
	
	method siguiente() {
		if(index == imagenes.size()){
			index = 0
			return imagenes.get(index)
		}else {
			return imagenes.get(index) 
		}
	}
}
