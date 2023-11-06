import wollok.game.*

object puntaje {
	var property puntaje = 0
	var property position = game.at(game.width()/2,game.height() - 1)
	method text() = puntaje.toString()
	method textColor() = "00FF00FF"
	
	method puntaje(puntajeAgregado){
		if(puntaje + puntajeAgregado >= 1000) puntaje = 999
		else puntaje = puntaje + puntajeAgregado
	}
	
	method reiniciar(){
		puntaje = 0
	 	position = game.at(game.width()/2,game.height() - 1)
	}
}

class PuntajeDigital{
	const property imagenes=[
		"digits/cero.png",
		"digits/uno.png",
		"digits/dos.png",
		"digits/tres.png",
		"digits/cuatro.png",
		"digits/cinco.png",
		"digits/seis.png",
		"digits/siete.png",
		"digits/ocho.png",
		"digits/nueve.png"
		]
}
/* 
 
object miles inherits PuntajeDigital{
	method position() {return game.at(5,12)}
	method image() {
		const digito = {puntaje.puntaje().div(1000)} 
		return self.imagenes().get(digito)
	}
}
 
*/

object centenas inherits PuntajeDigital{
	method position() {return game.at(game.width()/2 - 1,12)} 
	method image(){
		const digito = (puntaje.puntaje() - (puntaje.puntaje().div(1000))*1000).div(100)
		return self.imagenes().get(digito)
	}
}
	
object decenas inherits PuntajeDigital{
	method position(){return game.at(game.width()/2,12)} 
	method image() {		
		const digito = (puntaje.puntaje() % 100/10).truncate(0)
		return self.imagenes().get(digito)
	}
}
	
object unidades inherits PuntajeDigital{
	method position(){return game.at(game.width()/2 + 1,12)} 
	method image(){
		const digito = puntaje.puntaje() % 10
		return self.imagenes().get(digito)	
	}
}

