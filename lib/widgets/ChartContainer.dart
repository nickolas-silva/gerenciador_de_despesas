import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gd_app/view/colors.dart';

class ChartContainer extends StatefulWidget {
  const ChartContainer({super.key});

  @override
  State<StatefulWidget> createState() => _ChartContainer();
}

class _ChartContainer extends State<ChartContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 40),
      padding: const EdgeInsets.all(12),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(66, 0, 0, 0),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: DChartPie(
              data: const [
                {'domain': 'Meta de gastos', 'measure': 700},
                {'domain': 'Gasto atual', 'measure': 1050},
              ],
              fillColor: (pieData, index) {
                switch (pieData['domain']) {
                  case 'Meta de gastos':
                    return roxoClaro;
                  case 'Gasto atual':
                    return roxoForte;
                }
              },
              pieLabel: ((pieData, index) {
                return "R\$${pieData['measure']}";
              }),
              donutWidth: 30,
              labelColor: Colors.black,
              labelPosition: PieLabelPosition.auto,
            ),
          )
        ],
      ),
    );
  }
}
