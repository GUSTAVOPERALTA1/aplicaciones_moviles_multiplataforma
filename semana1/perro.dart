import "dart:io";
void main(){
  stdout.writeln("Ingresa la edad de tu perro: ");
  var anios= stdin.readLineSync();
  double edad= double.parse(anios);
  var resultado= edad*7;
  print("Tu perro tiene $resultado años humanos");
}