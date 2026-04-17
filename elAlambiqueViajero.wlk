object llaveroTorreEiffel {}

object mate {
  var conYerba = true
  method conYerba() = conYerba
  method ponerYerba() { conYerba = true }
  method sacarYerba() { conYerba = false }
}

object bidonDePetroleo {}
object armaDestruccionMasiva {}
object jardinColgante {}

object katana {}

object alambiqueVeloz {
  var combustible = 100
  method tieneSuficienteCombustible() = combustible > 0
  method esRapido() = true
  method viajar() { combustible = combustible - 10 }
  method combustible() = combustible
}

object superChatarraEspecial {
  const canones = 3
  var municiones = 10
  method tieneSuficienteCombustible() = (canones * municiones) > 0
  method esRapido() = false
  method viajar() { municiones = municiones - 1 }
  method combustible() = canones * municiones
}

object antiguallaBlindata {
  var gangsters = 10
  method tieneSuficienteCombustible() = true
  method esRapido() = gangsters > 5
  method viajar() { gangsters = gangsters - 1 }
  method gangsters() = gangsters
}

object superConvertible {
  var modo = "deportivo"
  method tieneSuficienteCombustible() = modo == "economico"
  method esRapido() = modo == "deportivo"
  method viajar() {}
  method convertirA(nuevoModo) { modo = nuevoModo }
  method modo() = modo
}

object paris {
  method puedeVisitar(vehiculo) = vehiculo.tieneSuficienteCombustible()
  method recuerdoTipico() = llaveroTorreEiffel
}

object buenosAires {
  var regalaYerba = true
  method puedeVisitar(vehiculo) = vehiculo.esRapido()
  method recuerdoTipico() {
    if (regalaYerba) {
      mate.ponerYerba()
    } else {
      mate.sacarYerba()
    }
    return mate
  }
  method regalaYerba(valor) { regalaYerba = valor }
}

object bagdad {
  var recuerdoActual = bidonDePetroleo
  method puedeVisitar(vehiculo) = true
  method recuerdoTipico() = recuerdoActual
  method cambiarRecuerdo(nuevoRecuerdo) { recuerdoActual = nuevoRecuerdo }
}

object lasVegas {
  var ciudadHomenajeada = paris
  method puedeVisitar(vehiculo) = ciudadHomenajeada.puedeVisitar(vehiculo)
  method recuerdoTipico() = ciudadHomenajeada.recuerdoTipico()
  method homenajearA(ciudad) { ciudadHomenajeada = ciudad }
  method ciudadHomenajeada() = ciudadHomenajeada
}

object tokio {
  method puedeVisitar(vehiculo) = vehiculo.esRapido() && vehiculo.tieneSuficienteCombustible()
  method recuerdoTipico() = katana
}

object luke {
  var lugaresVisitados = 0
  var recuerdo = null
  var vehiculo = alambiqueVeloz

  method lugaresVisitados() = lugaresVisitados
  method recuerdo() = recuerdo
  method vehiculo() = vehiculo
  method cambiarVehiculo(nuevoVehiculo) { vehiculo = nuevoVehiculo }

  method viajar(ciudad) {
    if (ciudad.puedeVisitar(vehiculo)) {
      recuerdo = ciudad.recuerdoTipico()
      lugaresVisitados = lugaresVisitados + 1
      vehiculo.viajar()
    }
  }
}
