import carpas.*
import personas.*
import paises.*
import jarras.*

class Cerveza {
	var property origen
	var property graduacionAlcoholica = 0
	const property lupulo = 0
}
/*Gerardo, esta parte es similar la que me corregiste el otro dia 
 *  en el ejercicio de plagas con capacidad de produccion de 
 *  las huertas.
 */
object graduacion{
	var property graduacionReglamentaria = 8
}

class Rubia inherits Cerveza{}

class Negra inherits Cerveza{
	override method graduacionAlcoholica(){
		return graduacion.graduacionReglamentaria().min(self.lupulo() * 2)
	}
}

class Roja inherits Negra{
	override method graduacionAlcoholica(){
		return super() * 1.25
	}
}