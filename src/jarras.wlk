import marcas.*
import personas.*
import paises.*
import carpas.*

class Jarra{
	var property litros = 0
	var property marca
	method contendioAlcoholico(){
		return(litros * marca.graduacionAlcoholica()) /100
	}
}
