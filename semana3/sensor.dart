import "dart:io";
void main() {
  print("Hola");
  final objeto = new Sensores();
  objeto.ingresar();
  objeto.mostrar();
}
class Sensores{
  List todo = [];
  void ingresar() {
    print("Ingrese los datos solicitados: ");
    print("id_sensor: ");
    var id= stdin.readLineSync();
    print("Valor: ");
    var valor= stdin.readLineSync();
    print("Fecha del registro: ");
    var fecha= stdin.readLineSync();
      
    Map <dynamic,dynamic> save ={
   "id sensor": id,
    "Valor": valor,
    "Fecha": fecha
    };
    todo.add(save);
    
    
  }

  void mostrar() {
  print("Se muestran todos los datos agregados: ");
  print(todo);
  }
  
}

