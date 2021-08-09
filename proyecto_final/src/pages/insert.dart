import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class InsertNew extends StatefulWidget{
  static Widget create(BuildContext context) => InsertNew();

  @override
  State<StatefulWidget> createState() => _InsertNewState();
}

class _InsertNewState extends State<InsertNew>{

  //Validar Campos
  String? emailValidator(String? value){
    return (value == null || value.isEmpty)? 'Campos requeridos': null;
  }

  final firebaseRealtime = FirebaseDatabase.instance.reference();

  final nombre = TextEditingController();
  final email = TextEditingController();

  void insetar_firebase() {
      firebaseRealtime.child('agenda').push().set({
        'nombre' : "${nombre.text}",
        'email' : "${email.text}",
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Insertar nuevos datos'),
    ),
      body: Column(
        children: [
          Container( padding: EdgeInsets.all(15),
          child:  TextFormField(
            controller: nombre,
            validator: emailValidator,
            decoration: InputDecoration(
              helperText: "Nombre",
              ),
            ),
          ),
          Container( padding: EdgeInsets.all(15),
            child:  TextFormField(
              controller: email,
              validator: emailValidator,
              decoration: InputDecoration(
                  helperText: "Email"
              ),
            ),
          ),
          SizedBox(height: 10),
          RaisedButton(
            child: Text('Añadir'),
              onPressed: (){
                insetar_firebase();
                _Listo();
              }
              ),
        ],
      ),
    );
  }
  void _Listo() {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text("Felicidades"),
            content: Text("Elementos añadidos"),
            actions: <Widget>[
              RaisedButton(
                child: Text("CERRAR", style: TextStyle(color: Colors.white),),
                onPressed: (){ Navigator.of(context).pop(); },
              ),
            ],
          );
        }
    );
  }
}
