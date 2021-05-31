import "dart:io";
List total= []; // Nueva lista
void main(){ //Metodo primario
  var repetir = "si"; //Variable para repeticion
  while (repetir == "si"){ //Mientras la respuesta sea igual, se repetira la acción  

    print("\n************************************************************************\nElige una opción. Escribe el numero del 1 al 4\n 1)Mostrar todos los datos.\n 2)Insertar un nuevo registro\n 3)Modificar un registro\n 4)Eliminar un registro.\n************************************************************************" );
    var opcion= stdin.readLineSync(); //Variable para almacenar el dato dado por el usuario

    if(opcion == "1"){ // Decidimos cual dato inserto el usuario
      uno();
    }
    if(opcion == "2"){
      dos();
    }
    if(opcion == "3"){
      tres();
    } 
    if(opcion == "4"){
      cuatro();
    }
    print("¿Desea hacer otra operación? si/no"); 
    repetir = stdin.readLineSync(); //Si la respuesta es "si", se repetira el ciclo.
  }  
}

void uno(){ //Metodo para mostrar todos los datos
  print("Se muestran todos los registros agregados: ");
  print(total);
}
void dos(){ //Metodo para insertar datos
  print("Ingresa los datos");
  print("Nombre: ");
  var nombre= stdin.readLineSync();
  print("Telefono: ");
  var telefono= stdin.readLineSync();
  print("Email: ");
  var email= stdin.readLineSync();

  Map < dynamic,dynamic> save ={
    "Nombre": nombre,
    "Telefono": telefono,
    "Email": email
  };

  total.add(save);

}
void tres(){ //Metodo para modificar datos
  uno();
  print("Nombre de la persona a modificar: ");
  var nombre = stdin.readLineSync();
  for(int i=0; i < total.length; i++){
    var mod = new Map();
    mod = total[i];

    if(nombre == mod['nombre']){
      print("Nombre nuevo: ");
      var nuevoNombre = stdin.readLineSync();
      print("Numero nuevo: ");
      var nuevoNumero = stdin.readLineSync();
      print("Nuevo Email: ");
      var nuevoEmail = stdin.readLineSync();
      mod["Nombre"] = nuevoNombre;
      mod["Telefono"] = nuevoNumero;
      mod["Email"] = nuevoEmail;
      total[i] = mod;
      print(total);
    }
  }
}
void cuatro(){ //Metodo para eliminar datos
  uno();
  print("Nombre de la persona a eliminar: ");
  var killName= stdin.readLineSync();
  for(int i=0; i < total.length; i++){
    var killMape = new Map();
    killMape = total[i];

    if (killName == killMape["Nombre"]){
      total.removeAt(i);
      print(total);
    }  
  }  
}