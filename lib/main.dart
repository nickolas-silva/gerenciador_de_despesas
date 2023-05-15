import 'package:flutter/material.dart';
import 'package:gd_app/view/pages/login.dart';
import 'package:gd_app/view/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'gd_app',
      initialRoute: '/login',
      routes: {
        '/login': (context) => ViewLogin(),
        // '/home': (context) => ViewHome(),
        '/register': (context) => Register(),
      },
    );
  }
}
