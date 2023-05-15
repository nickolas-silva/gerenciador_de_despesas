import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gd_app/models/Payment.dart';
import 'package:gd_app/utils/api.dart';
import 'package:gd_app/view/colors.dart';
import 'package:gd_app/view/drawer.dart';
import 'package:gd_app/view/pages/despesas.dart';
import 'package:gd_app/view/pages/resumo.dart';
import 'package:gd_app/widgets/widgettext.dart';

import '../../models/User.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  List<Widget> listTabs = [
    Tab(
      icon: Icon(Icons.home),
      text: 'HOME',
    ),
    Tab(
      icon: Icon(Icons.escalator_rounded),
      text: 'DESPESAS',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: listTabs.length,
        child: Scaffold(
          drawer: DrawerItens(
            user: widget.user,
          ),
          appBar: AppBar(
            backgroundColor: roxoForte,
            elevation: 5,
            //title: const Text('Home', style: TextStyle( color: roxoClaro, fontSize: 20, fontWeight: FontWeight.w900),),
            title: WidgetText(
              text: 'GD_app',
              color: roxoClaro,
              size: 20,
              weight: FontWeight.w900,
            ),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: azul,
              indicatorWeight: 5,
              labelColor: azul,
              tabs: listTabs,
            ),
          ),
          body: TabBarView(
            children: [
              TabResumo(
                user: widget.user,
              ),
              TabDespesa(
                user: widget.user,
              )
            ],
          ),
        ));
  }
}
