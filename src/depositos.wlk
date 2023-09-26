import bicis.*
import accesorios.*

class Deposito {
	const bicis = []
	
	method agregarBicis(nuevasBicis) {
		if(nuevasBicis.any { bici => bicis.contains(bici) } or nuevasBicis.any { bici => nuevasBicis.occurrencesOf(bici) > 1 } ) {
			throw new Exception(message="no se puede agregar dos veces una misma bici")
		}
		bicis.addAll(nuevasBicis)
	}
	method sacarBicis(bicisASacar) {
		if(!bicisASacar.all { bici => bicis.contains(bici) } ) {
			throw new Exception(message="no todas las bicis a sacar se encuentran en el depósito")
		}
		bicis.removeAll(bicisASacar)
	}
	method bicisRapidas() {
		return bicis.filter { bici => bici.velocidadCrucero() > 25 }
	}
	method marcas() {
		return bicis.map { bici => bici.marca() }.asSet()
	}
	method esNocturno() {
		return bicis.all { bici => bici.tieneLuz() }
	}
	method esNocturno(coleccion) {
		return coleccion.all { bici => bici.tieneLuz() }
	}
	method algunaPuedeCargar(peso) {
		return bicis.any { bici => bici.carga() >= peso }
	}
	method marcaDeLaMasRapida() {
		return bicis.max { bici => bici.velocidadCrucero() }.marca()
	}
	method cargaTotalBicisLargas() {
		return self.bicisLargas().sum { bici => bici.carga() }
	}
	method bicisLargas() {
		return bicis.filter { bici => bici.largo() > 170 }
	}
	method cantidadSinAccesorios() {
		return bicis.filter { bici => bici.accesorios().isEmpty() }.size()
	}
	// DESAFIOS
	method bicisCompanierasDe(unaBici) {
		return bicis.filter({bici => bici.esCompanieraDe(unaBici)})
	}
	method hayCompanieras() {
		return bicis.any { bici => self.bicisCompanierasDe(bici).isEmpty().negate() }
	}
	method paresDeCompanieras() {
		const parejasDeBicis = #{}
		bicis.forEach ({ bici => self.agregarBiciConParejaEn(bici,parejasDeBicis) })
		return parejasDeBicis
	}
	method agregarBiciConParejaEn(unaBici,listaDeParejasDeBicis) {
		if(self.hayCompanieraDe(unaBici))
			listaDeParejasDeBicis.add(#{unaBici,self.biciCompanieraDe(unaBici)})
	}
	method biciCompanieraDe(unaBici) {
		return bicis.find({bici => bici.esCompanieraDe(unaBici)})
	}
	method hayCompanieraDe(unaBici) {
		return self.bicisCompanierasDe(unaBici).size() > 0
	}
	method seHizoLaLuz() {
		return self.hayAlgunaBiciConLuz() and self.esNocturno(bicis.drop(self.indicePrimeraBiciConLuz()))
	}
	method hayAlgunaBiciConLuz() {
		return bicis.any { bici => bici.tieneLuz() }
	}
	method indicePrimeraBiciConLuz() {
    	return (0..bicis.size()-1).find { indice => bicis.get(indice).tieneLuz() }
	}
}