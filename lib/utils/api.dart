import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:gd_app/models/Debt.dart';
import 'package:gd_app/models/User.dart';
import 'package:http/http.dart' as http;

// final url = Uri.parse("http://10.215.10.239:3333/user/1");
// final url = Uri.parse("http://localhost:3333/user/1");
// final url = Uri.parse("http://192.168.0.15:3333/user/1");
// final url = Uri.parse("https://jsonplaceholder.typicode.com/users/1");
// final url = Uri.parse("10.0.2.2/user/1");

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
