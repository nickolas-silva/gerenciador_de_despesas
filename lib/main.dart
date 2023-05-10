import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gd_app/view/pages/login.dart';
import 'package:gd_app/view/pages/register.dart';

import 'view/pages/home.dart';

void main() {
  runApp(MyApp());
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
        '/home': (context) => ViewHome(),
        '/register': (context) => Register(),
      },
    );
  }
}
