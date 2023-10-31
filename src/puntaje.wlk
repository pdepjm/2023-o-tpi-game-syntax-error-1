import wollok.game.*

object puntaje {
	var property puntaje = 0
	var property position = game.at(game.width()/2,game.height() - 1)
	method text() = puntaje.toString()
	method textColor() = "00FF00FF"
	
	method puntaje(puntajeAgregado){puntaje = puntaje+puntajeAgregado}
	
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
	 method miles(){
	 	return puntaje.puntaje().div(1000)	
	 }
	 method cientos(){
	 	return (puntaje.puntaje()- self.miles()*1000).div(100)
	 }
	 method decenas(){
	 	return (puntaje.puntaje()%100/10).truncate(0)	
	 }
	 method unidades(){
	 	return puntaje.puntaje()%10
	 }
	
}
class Miles inherits PuntajeDigital{
	var property position = game.at(1,game.height()-2)
	var property digito = self.miles()
	method image() = self.imagenes().get(digito)
	method show() = game.addVisual(self)
}

class Cientos inherits PuntajeDigital{
	var property position = game.at(2,game.height()-2)
	var property digito = self.cientos()
	method image() = self.imagenes().get(digito)
	}
	
class Decenas inherits PuntajeDigital{
	var property position = game.at(3,game.height()-2)
	var property digito = self.decenas()
	method image() = self.imagenes().get(digito)
	}
	
class Unidades inherits PuntajeDigital{
	var property position = game.at(4,game.height()-2)
	var property digito = self.unidades()
	method image() = self.imagenes().get(digito)
	}