import Agresiones.*
import Persona.*

object actitudMilitante{
	method haceLaDenuncia(agresion, persona) {}
	method afrontarAmenaza() = actitudAguerrida
}
object actitudMiedosa{
	method haceLaDenuncia(agresion, persona) = false
	method afrontarAmenaza() = self
}
class ActitudPaciente {
	var nivelDeTolerancia
	
	method sonPocasDenuncias(agresiones) = agresiones.size() < 3
	method superaUmbral(agresiones, victimario) = agresiones.
	count({ agresion => agresion.victimario() == victimario }) > nivelDeTolerancia
	
	method haceLaDenuncia(agresion, persona) = if(!self.sonPocasDenuncias(persona.agresionesRecibidas())) 
	self.superaUmbral(persona.agresionesRecibidas(), agresion.victimario()) else false
	
	method afrontarAmenaza() {
		nivelDeTolerancia *= 2
		return self
	}
}
object actitudAguerrida{
	method esFamiliarGrave(agresionesFamiliares) = agresionesFamiliares.any({ agresion => agresion.esGrave() })
	
	method agresionesFamiliares(persona) = persona.agresionesRecibidas().
	filter({ agresionRecibida => agresionRecibida.victimarioEsFamiliar(persona)})
	
	method haceLaDenuncia(agresion, persona) = self.esFamiliarGrave(self.agresionesFamiliares(persona))
	
	method afrontarAmenaza() = new ActitudPaciente(nivelDeTolerancia = 5)
}