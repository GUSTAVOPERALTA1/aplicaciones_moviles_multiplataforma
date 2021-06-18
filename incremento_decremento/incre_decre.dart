import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _contador = 10;

  void _incre(){
    setState((){
      _contador++;
      _contador++;
    });
  }

   void _decre(){
    setState((){
      _contador--;
      _contador--;
      _contador--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Incremento y Decremento"),),
      body: Center(
        child: Text( '$_contador', 
        style: TextStyle(
          fontSize: 60,
          color: Colors.black87,),),),
       
      floatingActionButton: Column(
        children: <Widget> [
           SizedBox(
            height: 630.0,
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: _incre,
            tooltip: 'Incre',
            child: Icon(Icons.add),
          ),
         SizedBox(
            height: 15.0
          ),
          FloatingActionButton(
            onPressed: _decre,
            tooltip: 'Decre',
            child: Icon(Icons.remove),
          ),
          
        ],
      ),
    );
  }
}