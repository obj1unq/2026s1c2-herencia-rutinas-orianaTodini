class Rutinas {
    var property descanso = 0
    var property intensidadRunning = 0
    var property tiempo = 0
  method caloriasQuemadas(){
    return 100*(tiempo - descanso)* intensidadRunning
  }
 
}
class Running inherits Rutinas{
    method descansar() {
      if(tiempo > 20){
        descanso= 5
      }else { 
         descanso= 2
      }
    }
}


class Maraton inherits Running{
    
}

class Remo{

}


class RemoEnCompeticion inherits Remo{

}

