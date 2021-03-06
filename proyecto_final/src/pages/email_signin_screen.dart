import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/src/bloc/auth_cubit.dart';

class EmailSignIn extends StatefulWidget{
  static Widget create(BuildContext context) => EmailSignIn();

  @override
  State<StatefulWidget> createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //Validar campos
  String? validator(String? value) {
    return (value == null || value.isEmpty) ? 'Campos requeridos' : null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ingresar"),),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (_, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  if(state is AuthSigningIn) Center(
                      child: CircularProgressIndicator()),
                  Image.asset(
                    'assets/logo-firebase.png', height: 100, width: 100,),
                  // if(state is AuthError) Text(state.message,style: TextStyle(color: Colors.red, fontSize: 24)),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: validator,
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Contraseña'),
                    validator: validator,
                  ),
                  SizedBox(height: 5,),
                  Center(
                    child: ElevatedButton(
                        child: Text('Ingresar'),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            context.read<AuthCubit>()
                                .signInUserWithEmailAndPassword(
                              _emailController.text,
                              _passwordController.text,
                            );
                          }else {
                            return _showAlertDialog();
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
  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (buildcontext) {
      return AlertDialog(
        title: Text("Alerta"),
        content: Text("Credenciales incorrectas, intentelo de nuevo"),
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
