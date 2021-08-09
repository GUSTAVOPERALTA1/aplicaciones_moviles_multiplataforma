import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/src/app.dart';
import 'package:proyecto_final/src/bloc/auth_cubit.dart';
import 'package:proyecto_final/src/repository/implementations/auth_repository.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final authCubit = AuthCubit(AuthRepository());
  MaterialApp(
    theme: ThemeData(
      primaryIconTheme: IconThemeData(color: Colors.orange)
    ),
  );
  runApp(
    BlocProvider(
      create: (_)=> authCubit..init(),
      child: MyApp.create(),
    ),
  );
}
