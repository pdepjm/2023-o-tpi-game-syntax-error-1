import wollok.game.*
import setup.*
import puntaje.*
import animador.*
import enemigo.*
import nave.*
import sonido.*

object pulsarParaIniciar { 
	var property position = game.at(0,0)
	var property image = "fondoanimado/Fondo/fondo0.gif"
	
	const animador = new Animador (direccion="fondoanimado/Fondo/fondo", cantidad =59,extension=".gif")
	var property enemigos = []
	method animar() = animador
	
	method introduccion(){
		game.onTick(16.6, "animar_introduccion",{animador.animar(self)})
		
		
		const invoc_enemigos = [
			{new DragonRojo(position=setup.randomPos(0.1,0.9,0.70,0.45))},
			{new Moluscocerebro(position=setup.randomPos(0.1,0.9,0.70,0.45))},
			{new PajarosVerdes(position=setup.randomPos(0.1,0.9,0.70,0.45))},
			{new Cruz(position=setup.randomPos(0.1,0.9,0.70,0.45))},
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
