import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:gd_app/models/Debt.dart';
import 'package:gd_app/models/Payment.dart';
import 'package:gd_app/models/User.dart';
import 'package:http/http.dart' as http;

// final url = Uri.parse("http://10.215.10.239:3333/user/1");
// final url = Uri.parse("http://localhost:3333/user/1");
// final url = Uri.parse("http://192.168.0.15:3333/user/1");
// final url = Uri.parse("https://jsonplaceholder.typicode.com/users/1");
// final url = Uri.parse("10.0.2.2/user/1");

class Login {
  final User user;
  final Payment payment;

  Login({required this.user, required this.payment});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      user: json['user'],
      payment: json['payment'],
    );
  }
}

Future<List<Debt>?> fetchDebt(String id) async {
  try {
    final response =
        await http.get(Uri.parse("http://localhost:3333/debt-by-user/$id"));

    if (response.statusCode == 200) {
      List<Debt> debt = Debt.fromJson(jsonDecode(response.body)) as List<Debt>;
      return debt;
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

Future<User> getUser(String id) async {
  final response =
      await http.get(Uri.parse("http://192.168.0.15:3333/user/$id"));

  if (response.statusCode == 200) {
    var user = User.fromJson(jsonDecode(response.body));
    return user;
  } else {
    throw Exception("Could not load the data");
  }
}

Future<http.Response> createUser(User user) async {
  return await http.post(
    Uri.parse("http://192.168.0.14:3333/user"),
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<User>{user}),
  );
}

// Future<Login> login(String username, String password) async {
//   final response = await http.post()
// }
