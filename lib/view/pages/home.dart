import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gd_app/view/colors.dart';
import 'package:gd_app/view/drawer.dart';
import 'package:gd_app/view/pages/despesas.dart';
import 'package:gd_app/view/pages/resumo.dart';
import 'package:gd_app/widgets/widgettext.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({super.key});

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
          drawer: DrawerItens(),
          appBar: AppBar(
            backgroundColor: roxoForte,
            elevation: 5,
            title: WidgetText(
              text: 'HOME',
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
            children: [TabResumo(), TabDespesa()],
          ),
        ));
  }
}
