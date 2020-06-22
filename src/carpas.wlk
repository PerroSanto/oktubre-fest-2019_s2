import marcas.*
import personas.*
import paises.*

class Carpa {
	var property cupo = 0
	var property tieneBanda = true
	var property marcaDeCerveza = null
	const property  estanAdentro = []
	
	method  ingresarPersona(unaPersona){
		estanAdentro.add(unaPersona)
	}

	method dejaIngresar(unaPersona){
		return self.quedaLugar()  and not unaPersona.estaEbria() 
	}
	
	method quedaLugar(){
		return self.totalDePersonasAdentro() < cupo
	}
	
	method totalDePersonasAdentro(){
		return estanAdentro.size()
	}
	
	method servirJarra(unaPersona,cantLitros){
		if(estanAdentro.contains(unaPersona)){
			const jarra  = new Jarra(litros=cantLitros, marca = self.marcaDeCerveza())
			unaPersona.agarrarJarra(jarra)
		}else{
			self.error("Die Person, die Sie suchen, ist nicht im Zelt")
		}
	}
	
	method  ebriosEmpedernidos(){
		//revisar
		return estanAdentro.count({persona => persona.esEbrioEmpedernido()})
	}	
}