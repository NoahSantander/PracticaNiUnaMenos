import Actitudes.*
import Policia.*
import Experiencias.*

class Persona {
	const familia = []
	var actitudFrenteALaVida
	const agresionesRecibidas = []
	
	method agresionesRecibidas() = agresionesRecibidas
	
	method actitudFrenteALaVida() = actitudFrenteALaVida
	
	method esFamilia(persona) = familia.contains(persona)
	
	method agregarAgresion(agresion) {
		agresionesRecibidas.add(agresion)
	}
	
	method recibirAgresion(agresion) {
		self.agregarAgresion(agresion)
		self.hacerDenuncia(agresion)
	}
	
	method cumpleRequisitos(agresion) = agresion.esGrave() && agresion.esFamilia(self)
	
	method hacerDenuncia(agresion) {
		if(self.cumpleRequisitos(agresion) && actitudFrenteALaVida.haceDenuncia(agresion, self))
			policia.registrarDenuncia(agresion, self)
	}
	
	method vivirExperiencia(experiencia) {
		actitudFrenteALaVida = experiencia.cambiarActitud()
	}
}