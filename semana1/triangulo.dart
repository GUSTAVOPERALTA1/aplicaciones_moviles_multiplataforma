import "dart:io";
void main(){
  stdout.writeln("Ingresa la base del triangulo: ");
  var lado1= stdin.readLineSync();
  double base= double.parse(lado1);

  stdout.writeln("Ingrese la altura del triangulo: ");
  var lado2= stdin.readLineSync();
  double altura= double.parse(lado2);

  var area= (base*altura)/2;

  print("El area del triangulo es : $area");
}
