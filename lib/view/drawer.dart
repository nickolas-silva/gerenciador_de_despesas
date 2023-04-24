import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gd_app/view/colors.dart';

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
            children: [
              const SizedBox(height: 100,),
              ListTile(
                dense: true,
                    leading:
                    Icon(Icons.contacts_outlined, color: branco),
                    title: const Text(
                      "Perfil",
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: roxoClaro),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                ),
                
              
            ]
          ),
        ),
      ),
    );
  }
}