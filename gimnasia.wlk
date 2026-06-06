class Rutina{
    method intensidad()

    method descanso(tiempoPractica)

    method caloriasQuemadas(tiempo){
        return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
    }
}


class Running inherits Rutina{

    const property intensidad

    override method descanso(tiempoPractica){
        return if (tiempoPractica > 20) 
        {5} else
        {2}
    }
}


class MaratonBA inherits Running{
   // falta poner intensidad? 
      override method caloriasQuemadas(tiempo){
        return super(tiempo) * 2 // super = ejecuta el metodo de la clase padre y lo multiplica por 2
    }
}

class Remo inherits Rutina  {
  override method intensidad(){
    return 1.3
  }
   override method descanso(tiempoPractica){
    return (tiempoPractica) / 5
  }

}


class RemoEnCompeticion inherits Remo{
  override method intensidad(){
    return 1.7
  }
  override method descanso(tiempoPractica){
    return 2.max(super(tiempoPractica)-3) // super = ejecuta el metodo de la clase padre y le resta 3, luego devuelve el maximo entre ese resultado y 2
  }
}

// PERSONAS

class Persona {
   var property peso

   method caloriasQuemadas(rutina) {
      return rutina.caloriasQuemadas(self.tiempoEjercicio()) 
   }

   method pesoQuePerderia(rutina) {
      return self.caloriasQuemadas(rutina) / self.kilosPorCaloria()
   }

   method kilosPorCaloria() 

   method aplicarRutina(rutina) {
      return if(self.puedeHacerRutina(rutina)){
        peso -= self.pesoQuePerderia(rutina)
      }
   }
   method puedeHacerRutina(rutina) 

   method tiempoEjercicio() 
}


 class PersonaSedentaria inherits Persona {
   const property tiempoEjercicio 
   override method kilosPorCaloria() {
      return 7000
   }

   override method puedeHacerRutina(rutina) {
      return peso > 50
   }
}
class PersonaAtleta inherits Persona{

   override method kilosPorCaloria(){
    return 8000
   }
   override method tiempoEjercicio(){
    return 90
   }
    override method puedeHacerRutina(rutina){
      return self.caloriasQuemadas(rutina) > 10000
    }
    override method pesoQuePerderia(rutina){
     return  super(rutina)- 1
    }
}

class Club{
  const property predios // predios=#{recreo, nautico}
   
  method elMejorPredioParaPersona(persona){
    return predios.max({predio => predio.caloriasQuemadasPor_SiHaceTodasLasRutinas(persona)})
  }
  method elPredioMasTranquiloParaPersona(persona){
    return predios.filter({predio => predio.hayRutinasTranquiPara(persona)})
  }
  method elPredioMasExigenteParaPersona(persona){
    return predios.map({predio => predio.rutinaMasExigentePara(persona)}).asSet()
  }
}

class Predio{
  const property rutinas // rutinas=#{correrEnLaPlaya, maratonBA} 
  method caloriasQuemadasPor_SiHaceTodasLasRutinas(persona){
    return rutinas.sum({rutina => persona.caloriasQuemadas(rutina)})
  }
   method hayRutinasTranquiPara(persona){
        return rutinas.any({rutina => persona.caloriasQuemadas(rutina) < 500})
    }
  method rutinaMasExigentePara(persona){
    return rutinas.max({rutina => persona.caloriasQuemadas(rutina)})
  }
}
