class Farolito {
	method esLuminoso() = true
	method peso() = 0.5
	method carga() = 0
}

class Canasto {
	const volumen
	method esLuminoso() = false
	method peso() = volumen / 10
	method carga() = volumen * 2
}

class Morral {
	const largo
	var property tieneOjoDeGato = true
	
	method esLuminoso() = tieneOjoDeGato
	method peso() = 1.2
	method carga() = largo / 3
}

/* 
   Si quiero agregar un nuevo accesorio, lo que debo hacer es que se respete el polimorfismo que se hace
   con los otros accesorios, en otras palabras, que ese nuevo accesorio entienda los mismos mensajes que
   los demas.
*/