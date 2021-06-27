
import 'dart:math';

import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}
class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina de inicio'),
        backgroundColor: Colors.red,
      ),
      body: Center(child: Text('Presiona el boton para ir a la siguiente pagina')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context){
              return PlayerWidget();
            }),
          );
        }
      ),
    );
  }
}

class PlayerWidget extends StatefulWidget{
  @override
  State<PlayerWidget> createState() {
    return new _PlayerWidgetState();
  }
}
class _PlayerWidgetState extends State<PlayerWidget>{
  TextEditingController numero1Controller = new TextEditingController();
  final numero2Controller = TextEditingController();
  var  resultadoS=0;

  void _suma(){
    setState(() {
  int num1 = int.parse(numero1Controller.text);
  int num2 = int.parse(numero2Controller.text);
  resultadoS=num1+num2;
  print(resultadoS);
    });
  }
  void _resta(){
    setState(() {
    int num1 = int.parse(numero1Controller.text);
    int num2 = int.parse(numero2Controller.text);
    resultadoS=num1-num2;
    print(resultadoS);
    });
  }
  void _multi(){
    setState(() {
    int num1 = int.parse(numero1Controller.text);
    int num2 = int.parse(numero2Controller.text);
    resultadoS=num1*num2;
    print(resultadoS);
    });
  }
  void _div(){
    setState(() {
    double num1 = double.parse(numero1Controller.text);
    double num2 = double.parse(numero2Controller.text);
    resultadoS=num1~/num2;
    print(resultadoS);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("Ingresa los valores a operar"),
      backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: numero1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                helperText: "Numero 1",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 3
                  )
               ),
              ),
            )
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: numero2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                helperText: "Numero 2",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 3
                  )
               ),
              ),
            )
          ),
          Container(child: Text('$resultadoS',style: TextStyle(fontSize: 60)))
        ]
      ),
      floatingActionButton: new Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new FloatingActionButton(child: Text('+',style: TextStyle(fontSize: 40)),
              onPressed:_suma, 
            ),
            new FloatingActionButton(child: Text('-',style: TextStyle(fontSize: 40),),
              onPressed:_resta, 
            ),
            new FloatingActionButton( child: Text('x',style: TextStyle(fontSize: 40),),
              onPressed:_multi, 
            ),
            new FloatingActionButton( child: Text('/',style: TextStyle(fontSize: 40),),
              onPressed:_div, 
            ),
          ],
        ),
      ),  
    );
  }
}