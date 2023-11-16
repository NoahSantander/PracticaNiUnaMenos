import Actitudes.*

object participarDeOrganizacionSocial {
	method cambiarActitud(victima) = actitudMilitante
}

class Acompanamiento {
	const persona
	method cambiarActitud(victima) = persona.actitudFrenteALaVida()
}

object amenazaDeMuerte {
	method cambiarActitud(victima) = victima.actitudFrenteALaVida().afrontarAmenaza()
}