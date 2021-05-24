import "dart:io";
void main(){
  stdout.writeln("Ingresa la calificacion 1 (valor 20%): ");
  var cal1= stdin.readLineSync();
  double valor1= double.parse(cal1);

  stdout.writeln("Ingresa la calificacion 2 (valor 30%): ");
  var cal2= stdin.readLineSync();
  double valor2= double.parse(cal2);

  stdout.writeln("Ingresa la calificacion 3 (valor 50%): ");
  var cal3= stdin.readLineSync();
  double valor3= double.parse(cal3);

  var promedio1= (valor1*100)/20;
  var promedio2= (valor2*100)/30;
  var promedio3= (valor3*100)/50;
  
  var resultado= (promedio1+promedio2+promedio3)/10;
  print("El promedio del alumno es: $resultado");
}