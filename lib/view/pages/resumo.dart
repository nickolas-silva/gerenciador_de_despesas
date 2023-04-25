import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gd_app/view/colors.dart';
import 'package:gd_app/widgets/ChartContainer.dart';
import 'package:gd_app/widgets/InfoContainer.dart';

class TabResumo extends StatefulWidget {
  const TabResumo({super.key});

  @override
  State<TabResumo> createState() => _ViewResumoState();
}

class _ViewResumoState extends State<TabResumo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white10,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Gasto mensal",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              InfoContainer(),
              Text(
                "Estatísticas",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              ChartContainer(),
            ],
          ),
        ));
  }
}
