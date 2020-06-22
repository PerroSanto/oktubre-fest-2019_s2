import marcas.*
import carpas.*
import paises.*

class Persona {
	var property peso = 0
	const property jarrasCompradas = []
	var property leGustaLaMusica = true
	var property aguante = 0
	/*Esto lo vi el sabado con Joaquin para forzar a que los objetos
	 * heredados definan el metodo y no de error wollok
	 * en esPatriota. Asi puedo meter el metodo dentro de persona
	 * y no en los objetos que la heredan
	*/
	method pais()
	
	method estaEbria(){
		return (self.alcoholIngerido() * peso) > aguante
	}
	
	method alcoholIngerido(){
		return self.jarrasCompradas().sum({jar => jar.contendioAlcoholico()})
	}
	
	//Lo mismo 
	method leGustaCervezaMarca(unaMarca)
	
	method quiereEntrar(unaCarpa){
		return self.leGustaLaMusica() == unaCarpa.tieneBanda() and 
		self.leGustaCervezaMarca(unaCarpa.marcaDeCerveza())
	}
	
	method puedeEntrar(unaCarpa){
		return self.quiereEntrar(unaCarpa) and
		unaCarpa.dejaIngresar(self)
	}
	
	method entrarALaCarpa(unaCarpa){
		if (self.puedeEntrar(unaCarpa)){
			unaCarpa.ingresarPersona(self)
		}else{
			self.error("du bist betrunken oder diese bis die Kugeln")
		}
	}
	
	method agarrarJarra(unaJarra){
		jarrasCompradas.add(unaJarra)
	}

	method esPatriota(){
		return self.jarrasCompradas().all({jarra => jarra.marca().origen() == self.pais()})
	}
	
	method esEbrioEmpedernido(){
		return jarrasCompradas.all({jarra => jarra.litros() >= 1})
	}	
}
class Belga inherits Persona{
	 const pais = belgica
	override method pais(){
	 	return pais
	 }
	override method leGustaCervezaMarca(unaMarca) {
		return unaMarca.lupulo() > 4
	}
}

class Checo inherits Persona{
	const pais = checoslovaquia
	override method pais(){
	 	return pais
	 }
	override method leGustaCervezaMarca(unaMarca) {
		return unaMarca.graduacionAlcoholica() > 8
	}
}

class Aleman inherits Persona{
	const pais = alemania
	override method pais(){
	 	return pais
	 }
	override method leGustaCervezaMarca(unaMarca) {
		return true
	}
	override method quiereEntrar(unaCarpa){
		return super(unaCarpa) and unaCarpa.estanAdentro().size().even()
	}
}
