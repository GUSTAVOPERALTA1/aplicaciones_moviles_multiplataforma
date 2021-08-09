import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:proyecto_final/src/bloc/auth_cubit.dart';
import 'package:proyecto_final/src/navegation/routes.dart';

class IntroScreen extends StatelessWidget {
  static Widget create(BuildContext context) => IntroScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: _IntroPager(),
    );
  }
}

class _IntroPager extends HookWidget{
  final String text1 = 'Crea tu cuenta usando un Email para gestionar tu base de datos Firebase';
  @override
  Widget build(BuildContext context) {
    final isSigningIn = context.watch<AuthCubit>().state is AuthSigningIn;

    return AbsorbPointer(
      absorbing: isSigningIn,
     child: PageView(
     children: [
       _DescriptionPage(
         text: text1,
         imagePath:'assets/logo-firebase.png',
       ),
       _LoginPage(),
     ],
     ),
   );
  }
}

class _DescriptionPage extends StatelessWidget{
  final String text;
  final String imagePath;

  const _DescriptionPage({
    Key? key,
    required this.text,
    required this.imagePath}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 200,
            height: 200,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
                child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

    }


}

class _LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final isSigningIn = context.watch<AuthCubit>().state is AuthSigningIn;

    return Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Image.asset(
            'assets/login.png',
            width: 200,
            height: 200,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text('Inicio de Sesión',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if(isSigningIn) CircularProgressIndicator(),
          Padding(padding: EdgeInsets.symmetric(
              horizontal: 50,
          ),
            child: Column(
              children: [
                /*_LoginButton(
                  //text: 'Anonimo',
                  //imagePath: 'assets/incogni.png',
                  //color: Colors.grey,
                  //textColor: Colors.white,
                  //onTap: ()=> context.read<AuthCubit>().singInAnonymously(),
                ),
                */
                _LoginButton(
                  text: "Ingresa con email",
                  imagePath: 'assets/sobre.png',
                  color: Colors.red,
                  textColor: Colors.white,
                  onTap: () {
                      context.read<AuthCubit>().reset();
                      Navigator.pushNamed(context, Routes.signInEmail);
                    },
                ),
                SizedBox(height: 50),
                OutlineButton(
                    child: Text('Crea una cuenta'),
                    onPressed: () {
                      context.read<AuthCubit>().reset();
                      Navigator.pushNamed(context, Routes.createAccount);
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget{
  final String text;
  final String imagePath;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;

  const _LoginButton({Key? key,
    required this.text,
    required this.imagePath,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Material(
     color: color,
     elevation: 3,
     borderRadius: BorderRadius.all(Radius.circular(20)),
     child: InkWell(
       onTap: onTap,
       child: Container(
         padding: EdgeInsets.all(8),
         child: Row(
           children: [
             Image.asset(imagePath,width: 24,height: 24,),
             SizedBox(width: 20,),
             Text(
               text,
               style: TextStyle(
                 color: textColor,
                 fontWeight: FontWeight.bold,
                 fontSize: 18,
               ),
             )
           ],
         ),
       ),
     ),
   );
  }
}