import accesorios.*

class Bici {
	const rodado = 26
	const property largo = 120
	const property marca = "olmo"
	const property accesorios = []
	
	method altura() = rodado * 2.5 + 15
	method velocidadCrucero() = if(largo > 120) rodado + 6 else rodado + 2
	method carga() = accesorios.sum { accesorio => accesorio.carga() }
	method peso() = rodado/2 + accesorios.sum { accesorio => accesorio.peso() }
	method tieneLuz() = accesorios.any { accesorio => accesorio.esLuminoso() }
	method cantidadDeAccesoriosLivianos() = accesorios.count({accesorio => accesorio.peso() < 1})
	method esCompanieraDe(otraBici) {
		return marca == otraBici.marca() and (largo - otraBici.largo()).abs() <= 10 and self != otraBici
	}
}