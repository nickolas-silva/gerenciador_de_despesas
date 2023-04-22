import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrawerItens extends StatelessWidget {
  const DrawerItens({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.7 * MediaQuery.of(context).size.width,
      child: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          padding: EdgeInsets.only(top: 0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              //UserAccountsDrawerHeader(
                // arrowColor: Colors.white,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: Image.asset().image,
                //     fit: BoxFit.cover
                //   )
                // ),
                //accountName: , accountEmail: )
            ]
          ),
        ),
      ),
    );
  }
}