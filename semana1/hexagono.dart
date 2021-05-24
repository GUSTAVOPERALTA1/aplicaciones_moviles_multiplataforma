import "dart:io";
void main(){
  stdout.writeln("Ingresa el lado 1: ");
  var lado1= stdin.readLineSync();
  double a= double.parse(lado1);

  stdout.writeln("Ingrese el lado 2: ");
  var lado2= stdin.readLineSync();
  double b= double.parse(lado2);

  stdout.writeln("Ingrese el lado 3: ");
  var lado3= stdin.readLineSync();
  double c= double.parse(lado3);

  stdout.writeln("Ingrese el lado 4: ");
  var lado4= stdin.readLineSync();
  double d= double.parse(lado4);

  stdout.writeln("Ingrese el lado 5: ");
  var lado5= stdin.readLineSync();
  double e= double.parse(lado5);

  stdout.writeln("Ingrese el lado 6: ");
  var lado6= stdin.readLineSync();
  double f= double.parse(lado6);

  var peri = a+b+c+d+e+f;

  print("El perimetro del hexagono es: $peri");
}
