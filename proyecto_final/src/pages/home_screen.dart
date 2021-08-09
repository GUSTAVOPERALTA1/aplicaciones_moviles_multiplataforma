
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/src/bloc/auth_cubit.dart';
import 'package:proyecto_final/src/navegation/routes.dart';

class HomeScreen extends StatefulWidget{
  static Widget create(BuildContext context) => HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  List<String> items = [];
  bool reading = true;

  Future<void> readData() async{
    try{
      var url = Uri.parse(
        "https://proyecto-final-c9dfb-default-rtdb.firebaseio.com/agenda.json");
      var response = await http.get(url);
      var data = json.decode(response.body);

      items.clear();
      data.forEach((key, value){
        items.add(value["nombre"]);
        items.add(value["email"]);
      });
      setState(() {
        reading = false;
      });
    } catch (e) {
      print(e.toString());
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read Page"),
      ),
      body:
      ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index){
          return Container(
            child: Text(items[index]),
          );
        }
      ),
      floatingActionButton: new Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
        new ElevatedButton(child: Text('Read',style: TextStyle(fontSize: 20)),
        onPressed:_read,
      ),
      new ElevatedButton(child: Text('Insertar',style: TextStyle(fontSize: 20),),
          style: ElevatedButton.styleFrom(primary: Colors.green),
        onPressed: () {
          Navigator.pushNamed(context, Routes.insertNew);
        }
      ),
              new ElevatedButton(
                child: Text('Salir',style: TextStyle(fontSize: 20),),
                  onPressed: () => context.read<AuthCubit>().signOut(),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
    ],
    ),
      ),
    );
  }
  void _read(){
    readData();
  }
  }

