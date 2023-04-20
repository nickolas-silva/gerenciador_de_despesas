import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({super.key});

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {

  List<Widget> listTabs = [
    const Tab(
      icon: Icon(Icons.home),
      text: "Home",
    ),


  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}