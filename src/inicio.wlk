import wollok.game.*
import setup.*
import puntaje.*
import animador.*
import enemigo.*
import nave.*

object pulsarParaIniciar { 
	var property position = game.at(0,0)
	var property image = "fondoanimado/fondo00.gif"
	const animador = new Animador (imagenes = [
		"fondoanimado/fondo01.gif",
		"fondoanimado/fondo02.gif",
		"fondoanimado/fondo03.gif",
		"fondoanimado/fondo04.gif",
		"fondoanimado/fondo05.gif",
		"fondoanimado/fondo06.gif",
		"fondoanimado/fondo07.gif",
		"fondoanimado/fondo08.gif",
		"fondoanimado/fondo09.gif",
		"fondoanimado/fondo10.gif",
		"fondoanimado/fondo11.gif",
		"fondoanimado/fondo12.gif",
		"fondoanimado/fondo13.gif",
		"fondoanimado/fondo14.gif",
		"fondoanimado/fondo15.gif",
		"fondoanimado/fondo16.gif",
		"fondoanimado/fondo17.gif",
		"fondoanimado/fondo18.gif",
		"fondoanimado/fondo19.gif"
	])
	var property enemigos = []
	method animador()=animador
	
	method introduccion(){
		game.onTick(100,"animar_fondo",{animador.animar(self)})
		
		const invoc_enemigos = [
			{new DragonRojo(position=setup.randomPos(0.1,0.9,0.70,0.45))},
			{new Moluscocerebro(position=setup.randomPos(0.1,0.9,0.70,0.45))},
			{new PajarosVerdes(position=setup.randomPos(0.1,0.9,0.70,0.45))},
			{new Terodactilo(position=setup.randomPos(0.1,0.9,0.70,0.45))}
		]
		game.onTick(1000, "invocar_y_morir", {
			const enemigo = invoc_enemigos.anyOne().apply()
			game.addVisual(enemigo)
			enemigos.add(enemigo)
			game.schedule(3000, {
				enemigos.remove(enemigo)
				enemigo.morir(false)
			})
		})
		game.onTick(750, "mover_enemigo",{
			enemigos.forEach({enemigo => enemigo.moverse()})	
		})
		game.onTick(150, "animar_enemigo", {
			enemigos.forEach({enemigo => enemigo.animador().animar(enemigo)})
		})
	}
	
	method iniciar(){
		setup.setupBoard()
		game.addVisual(self)
		self.introduccion()
		keyboard.enter().onPressDo({
			setup.gameClear()
			game.addVisual(puntaje)
			setup.setupPlayer()
			setup.setupEnemy()
			setup.setupBala()
		})
	}
}
