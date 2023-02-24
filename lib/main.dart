import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/registro.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'login': (context) => const Login(),
        'registro': (context) => const Registro()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
    );
  }
}
