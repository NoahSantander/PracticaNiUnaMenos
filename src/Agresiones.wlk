import Persona.*

class Agresion {
	const lugar
	const victimario
	const conjuntoDePalabras
	
	method victimario() = victimario
	method lugar() = lugar
	
	method esGrave()
	method esIgnea()
	method seUsoFuego() = conjuntoDePalabras.contains("fuego")
	method victimarioEsFamiliar(persona) = persona.esFamilia(victimario)
}

class AgresionComun inherits Agresion {
	method seUsoPalabraInaceptable() = conjuntoDePalabras.any({ palabra => diccionario.esInaceptable(palabra) })
	
	override method esGrave() = self.seUsoPalabraInaceptable()
	
	override method esIgnea() = self.seUsoFuego()
}

class AgresionFisica inherits Agresion {
	var elemento
	
	override method esGrave() = true
	
	override method esIgnea() = if(elemento == "combustible") true else self.seUsoFuego()
}

object diccionario {

	const palabrasInaceptables = ["matar","asesinar","quemar"]
	
	method esInaceptable(unaPalabra){
		return palabrasInaceptables.contains(unaPalabra)
	}
	
}
