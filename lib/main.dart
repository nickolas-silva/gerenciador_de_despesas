import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'pages/home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'gd_app',
      theme: ThemeData(
          
      ),
      initialRoute: '/home',
      routes: {
        '/home':(context) => ViewHome(),

      },
    );
  }
}