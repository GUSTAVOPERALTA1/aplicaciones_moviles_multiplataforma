import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/src/bloc/auth_cubit.dart';

class EmailCreate extends StatefulWidget{
  static Widget create(BuildContext context) => EmailCreate();

  @override
  State<StatefulWidget> createState() => _EmailCreateState();
}

class _EmailCreateState extends State<EmailCreate>{
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  //Validar campos
  String? emailValidator(String? value){
    return (value == null || value.isEmpty)? 'Campos requeridos': null;
  }

  //Validar password
  String? passwordValidator(String? value){
    if(value == null || value.isEmpty) return 'Contraseña requerida';
    if(value.length <6) return 'El password debe ser mayor a 6 digitos';
    if(_passwordController.text!= _repeatPasswordController.text)
      return 'Las contraseñas no coinciden';
    return null;
  }



  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Crear una cuenta"),),
     body: BlocBuilder<AuthCubit,AuthState>(
       builder: (_,state){
         return Form(
           key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
            children: [
              if(state is AuthSigningIn) Center(child: CircularProgressIndicator()),
              Image.asset('assets/insertar.png',height: 100,width: 100,),
             //if(state is AuthError) Text(state.message,style: TextStyle(color: Colors.red, fontSize: 24)),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: emailValidator,
              ),
              SizedBox(height: 2,),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Contraseña'),
                  validator: passwordValidator,
              ),
              SizedBox(height: 2,),
              TextFormField(
                controller: _repeatPasswordController,
                decoration: InputDecoration(labelText: 'Repite Password'),
                validator: passwordValidator,
              ),
              SizedBox(height: 2,),
              Center(
                child: ElevatedButton(
                  child: Text('Crear Cuenta'),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      context.read<AuthCubit>().createUserWithEmailAndPassword(
                        _emailController.text,
                        _passwordController.text,
                      );
                    }
                  }
                ),
              )

            ],
          ),
         ),
         );
       },
     ),
     );
  }
  }