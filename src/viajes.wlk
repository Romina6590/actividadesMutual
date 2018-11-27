import socios.*

class Actividad{
	var property idiomas =#{}
    
    method implicaEsfuerzo()
	method diasActividad()
	method sirveParaBroncearse()

    method esInteresante(){
    	return idiomas.size() > 1
    }
    
    
}

class Playa inherits Actividad{
	var property largoPlaya
	
	override method diasActividad(){
		return largoPlaya/500
	}
	
	override method implicaEsfuerzo(){
		return largoPlaya > 1200
	}
	
	override method sirveParaBroncearse(){
		return true
	}
}

class ExcursionACiudad inherits Actividad{
	var property cantidadAtracciones
	
	override method diasActividad(){
		return cantidadAtracciones/2
	}
	
	override method implicaEsfuerzo(){
		return cantidadAtracciones >= 5
	}	
    
    override method sirveParaBroncearse(){
    	return false
    } 
    
    override method esInteresante(){
    	return super() or cantidadAtracciones == 5
    }
}
	
	
class ExcursionTropical inherits ExcursionACiudad{
	override method diasActividad(){
		return super() + 1
	}
	
	override method sirveParaBroncearse(){
		return true
	}
}

class Trekking inherits Actividad{
	var property kilometrosSenderos
	var property diasDeSolPorAnio
	
	override method diasActividad(){
		return kilometrosSenderos/50
	}
	
	override method implicaEsfuerzo(){
		return kilometrosSenderos > 80
	}
	
	override method sirveParaBroncearse(){
		return diasDeSolPorAnio > 200 or (diasDeSolPorAnio.between(100,200) and kilometrosSenderos > 120)
	}
	
	override method esInteresante(){
		return super() and diasDeSolPorAnio > 140
	}
	
}
 
class Gym inherits Actividad{
	override method idiomas(){
		return #{"espaniol"}
	}
	
	override method diasActividad(){
		return 1
	}
	
	override method implicaEsfuerzo(){
		return true
	}
	
	override method sirveParaBroncearse(){
		return false
	}
}

