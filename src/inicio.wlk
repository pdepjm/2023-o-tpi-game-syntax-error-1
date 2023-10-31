import wollok.game.*
import setup.*
import puntaje.*
import animador.*
import enemigo.*

object pulsarParaIniciar { 
	const property position = game.at(0,0)
	const property image = "fondoanimado/fondo00.gif"
	const enemigos = []
	method introduccion(){
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
			game.schedule(3000, {enemigo.morir(false)})
		})
		game.onTick(750, "mover_enemigo",{
			enemigos.forEach({enemigo => enemigo.moverse()})	
		})
		game.onTick(200, "animar_enemigo", {
			enemigos.forEach({enemigo => enemigo.animador().animar(enemigo)})
		})
	}
	
	method iniciar(){
		setup.setupBoard()
		game.addVisual(self)
		
		self.introduccion()
		
		keyboard.enter().onPressDo({
			game.clear()
			game.addVisual(puntaje)
			setup.setupPlayer()
			setup.setupEnemy()
			setup.setupBala()
		})
	}
}
