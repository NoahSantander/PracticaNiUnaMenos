object policia{
	var numero = 0
	const denuncias = #{}
	method aumentarNumero() {
		numero += 1
	}
	
	method darNumero() {
		self.aumentarNumero()
		return numero
	}
	
	method registrarDenuncia(agresionRecibida, persona) {
		denuncias.add(new Denuncia(victima = persona, 
		agresion = agresionRecibida, numero = self.darNumero()))
	} 
}
	
class Denuncia{
	const numero
	const agresion
	var property victima 
		
}