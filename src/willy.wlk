object willyWonka {
	var empleadosDisponibles=[]
	var proyectos=[]
	method contratar(oompaLoompa){
		empleadosDisponibles.add(oompaLoompa)
	}
	
	method tomarProyecto(proyecto){
		proyectos.add(proyecto)
		self.asignarEmpleado(proyecto)
	}
	
	method asignarEmpleado(proyecto){
		var empleadoAsignado 
		if (empleadosDisponibles.isEmpty()) 
			self.error("no tengo empleados")
		empleadoAsignado = empleadosDisponibles.first()
		proyecto.asignarEmpleado(empleadoAsignado)
		empleadosDisponibles.remove(empleadoAsignado)		
	}
	method cuantosProyectosInconclusos(){
		return proyectos.count({proyecto =>  not proyecto.estaTerminado()})
	}
	method pasarUnDia(){
		proyectos.forEach({proyecto => proyecto.pasarUnDia()})
	}
	method motivarEmpleadosAsignados(){
		proyectos.forEach({proyecto => proyecto.motivarEmpleados()})
	}
	method empleadosDisponibles(){
		return empleadosDisponibles.size()
	}
}

object cadbury {
	var features = 5
	var empleado
	method asignarEmpleado(_empleado){
		empleado = _empleado
	}
	method pasarUnDia(){
		features = features - empleado.features()
	}
	method motivarEmpleados(){
		empleado.motivar()
	}

	method estaTerminado() {
		return features <= 0
	}
}

object vaporware {
	var empleados = []
	var features = 20
	method asignarEmpleado(empleado){
		empleados.add(empleado)
	}
	method pasarUnDia(){
		features = features + empleados.sum({empleado => empleado.features()})
//		willyWonka.asignarEmpleado(self)
	}
	method motivarEmpleados(){
		empleados.forEach({empleado => empleado.motivar()})
	}
	method estaTerminado() {
		return features <= 0
	}
}
object verduleria {
	var diasRestantes = 10

	method asignarEmpleado(empleado){}
	method motivarEmpleados(){}
	
	method pasarUnDia(){
		diasRestantes = diasRestantes - 1
	}
	method estaTerminado() {
		return diasRestantes <= 0
	}
}	

object pepita { 
	var calorias = 0
	method features(){
		return calorias/500
	}
	method motivar(){
		calorias = calorias + 1000
	}
}
object juanCarlos { 
	method features(){
		return 1
	}
	method motivar(){}
}

object guillermoPuertas { 
	var anteojos = 2
	method features(){
		return anteojos
	}	
	method motivar(){
		anteojos += 1
	}
	
}
object estebanTrabajos { 
	var features=10
	method features(){
		return features
	}
	method motivar(){
		features -=1	
	}
}
object ricardo { 
	method features() { 
		return 0
	}	
	method motivar(){}
}

