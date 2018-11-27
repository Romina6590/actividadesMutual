import viajes.*

class Socio{
	var property edad
	var property idiomasQueHabla =#{} 
	var property actividadesRealizadas = #{}
	var property maxActividades
	
	method esAdoradorDelSol(){
		return actividadesRealizadas.all{actividades=>actividades.sirveParaBroncearse()}
	}
	
	method actividadesEsforzadas(){
		return actividadesRealizadas.filter{actividades=>actividades.implicaEsfuerzo()}
	}
	
	method agregarActividad(actividad){
		if (actividadesRealizadas.size() < maxActividades){
			actividadesRealizadas.add(actividad)
		}else{
			self.error("Se alcanzo el limite de actividades")
			
		}
	}
	
   method meAtrae(actividad)
   method actividadRecomendada(actividad){
   	if(actividad.esViaje()){
   		return actividad.esInteresante() and self.meAtrae(actividad) and not actividadesRealizadas.contains(actividad)
   	}else{
   		return self.edad().between(20,30)
   	}
   }
}

class Tranquilo inherits Socio{
	override method meAtrae(actividad){
		return actividad.diasActividad() >= 4
	}
	
}

class Coherente inherits Socio{
	override method meAtrae(actividad){
		if(self.esAdoradorDelSol()){
		  return actividad.sirveParaBroncearse()
		}else{
			return actividad.implicaEsfuerzo()
		}
	}
}

class Relajado inherits Socio{
	override method meAtrae(actividad){
		return not (idiomasQueHabla.intersection(actividad.idiomas())).isEmpty()
	}
}

