import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gd_app/models/Payment.dart';
import 'package:gd_app/models/User.dart';
import 'package:gd_app/utils/api.dart';
import 'package:gd_app/view/colors.dart';
import 'package:gd_app/widgets/ChartContainer.dart';
import 'package:gd_app/widgets/InfoContainer.dart';
import 'package:gd_app/widgets/widgettext.dart';

class TabResumo extends StatefulWidget {
  const TabResumo({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<TabResumo> createState() => _ViewResumoState();
}

class _ViewResumoState extends State<TabResumo> {
  late Future<Payment> payment;

  @override
  void initState() {
    super.initState();
    setState(() {
      payment = userPayment(widget.user.id!);
    });
  }

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
            children: [
              Text(
                "Gasto mensal",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Poppins'),
              ),
              FutureBuilder(
                  future: payment,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return InfoContainer(payment: snapshot.data as Payment);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return CircularProgressIndicator();
                    }
                  })),
              Text(
                "Estatísticas",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Poppins'),
              ),
              FutureBuilder(
                  future: payment,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return ChartContainer(payment: snapshot.data as Payment);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return CircularProgressIndicator();
                    }
                  }))
            ],
          ),
        ));
  }
}
