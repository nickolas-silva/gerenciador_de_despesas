import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gd_app/view/colors.dart';
import 'package:gd_app/view/drawer.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({super.key});

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerItens(),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: roxoClaro,
        title: const Text(
          'Home',
          style: TextStyle(
            color: roxoForte,
            fontSize: 20,
            fontWeight: FontWeight.w900
          ),
        ),
        centerTitle: true,

      ),
      body: Container(
        
      ),
    );
  }
}