import "dart:io";
void main(){
  stdout.writeln("Ingresa el tamaño del triangulo en metros: ");
  var rec= stdin.readLineSync();
  double tamano= double.parse(rec);

  var calculo = tamano/0.30;

  print("En tu terreno caben $calculo pokemones");
}