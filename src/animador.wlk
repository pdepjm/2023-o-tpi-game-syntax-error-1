import wollok.game.*

class Animador {
	var direccion 
	var index = 0
	var cantidad
	var extension
	
	
	method animar(objeto) {
		objeto.image(direccion + self.siguiente()+ extension)
	}
	
	method animarYRemover(objeto) {
		if(objeto.image()=="nave1.png"){
		direccion ="explosion/Explosion-"
		}else direccion = "nubeverde/ExplosionVerde-"
		var vez = 0
		game.onTick(200,"animar_remover",{vez = vez + 1
		objeto.image(direccion + self.siguiente()+ extension)
		if( game.hasVisual(objeto) && vez==8){
			game.removeVisual(objeto)
		}
		})
	}
	method siguiente(){
		if (index<cantidad){
			index = index + 1
			return index
			}
			index=0
			return index
	}
	
	//method siguiente() {
	//	index = index + 1
	//	try {
	//		return imagenes.get(index) 	
	//	}
	//	catch error {
	//		index = 0
	//		return imagenes.get(index)
	//	}		
	//}
 }