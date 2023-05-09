import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gd_app/models/User.dart';
import 'package:gd_app/utils/api.dart';
import 'package:gd_app/view/colors.dart';
import 'package:gd_app/widgets/widgettext.dart';

class DrawerItens extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _DrawerItens();
  }
}

class _DrawerItens extends State<DrawerItens> {
  late Future<User> _user;

  @override
  void initState() {
    super.initState();
    _user = getUser('1');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: _user,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: 0.7 * MediaQuery.of(context).size.width,
              child: Drawer(
                backgroundColor: Colors.white,
                child: Container(
                  padding: EdgeInsets.only(top: 0),
                  child: ListView(padding: EdgeInsets.zero, children: [
                    UserAccountsDrawerHeader(
                      arrowColor: Colors.white,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('./assets/backgroundDrawe.jpg'),
                              fit: BoxFit.cover)),
                      accountName: WidgetText(
                        text: snapshot.data?.email == null
                            ? ""
                            : snapshot.data!.email,
                        weight: FontWeight.w900,
                        color: Colors.white,
                        size: 14,
                      ),
                      accountEmail: WidgetText(
                        text: snapshot.data?.name == null
                            ? ""
                            : snapshot.data!.name,
                        weight: FontWeight.w900,
                        color: Colors.white,
                        size: 16,
                      ),
                      currentAccountPicture: InkWell(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://images.unsplash.com/photo-1681187636275-666cb92e1e38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
                                  ))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.info_outline,
                        color: roxoForte,
                        size: 30,
                      ),
                      title: const Text(
                        "Sobre",
                        style: TextStyle(
                            //fontFamily: 'nunito',
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: roxoForte),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.exit_to_app,
                        color: roxoForte,
                        size: 30,
                      ),
                      title: Text(
                        "Sair",
                        style: TextStyle(
                            color: roxoForte,
                            fontSize: 18,
                            fontWeight: FontWeight.w900),
                      ),
                      onTap: () => Navigator.pushNamed(context, "/login"),
                    )
                  ]),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Text("An error Occoured!");
          } else {
            return const CircularProgressIndicator();
          }
        }));

    // Container(
    //   width: 0.7 * MediaQuery.of(context).size.width,
    //   child: Drawer(
    //     backgroundColor: Colors.white,
    //     child: Container(
    //       padding: EdgeInsets.only(top: 0),
    //       child: ListView(padding: EdgeInsets.zero, children: [
    //         UserAccountsDrawerHeader(
    //           arrowColor: Colors.white,
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: AssetImage('./assets/backgroundDrawe.jpg'),
    //                   fit: BoxFit.cover)),
    //           accountName: WidgetText(
    //             text: _user.email == null ? "" : _user!.email,
    //             weight: FontWeight.w900,
    //             color: Colors.white,
    //             size: 14,
    //           ),
    //           accountEmail: WidgetText(
    //             text: _user?.name == null ? "" : _user!.name,
    //             weight: FontWeight.w900,
    //             color: Colors.white,
    //             size: 16,
    //           ),
    //           currentAccountPicture: InkWell(
    //             child: Container(
    //               width: 100,
    //               height: 100,
    //               decoration: BoxDecoration(
    //                   color: Colors.black,
    //                   shape: BoxShape.circle,
    //                   image: DecorationImage(
    //                       fit: BoxFit.cover,
    //                       image: NetworkImage(
    //                         "https://images.unsplash.com/photo-1681187636275-666cb92e1e38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
    //                       ))),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 20,
    //         ),
    //         ListTile(
    //           dense: true,
    //           leading: Icon(
    //             Icons.info_outline,
    //             color: roxoForte,
    //             size: 30,
    //           ),
    //           title: const Text(
    //             "Sobre",
    //             style: TextStyle(
    //                 //fontFamily: 'nunito',
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.w900,
    //                 color: roxoForte),
    //           ),
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //         ListTile(
    //           dense: true,
    //           leading: Icon(
    //             Icons.exit_to_app,
    //             color: roxoForte,
    //             size: 30,
    //           ),
    //           title: Text(
    //             "Sair",
    //             style: TextStyle(
    //                 color: roxoForte,
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.w900),
    //           ),
    //           onTap: () => Navigator.pushNamed(context, "/login"),
    //         )
    //       ]),
    //     ),
    //   ),
    // );
  }
}
