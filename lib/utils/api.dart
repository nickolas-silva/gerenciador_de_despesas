import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:gd_app/models/Debt.dart';
import 'package:gd_app/models/Payment.dart';
import 'package:gd_app/models/User.dart';
import 'package:gd_app/models/dto/UserDTO.dart';
import 'package:http/http.dart' as http;

// const url = "http://10.215.10.239:3333";
// const url = "http://localhost:3333/user/1";
const url = "http://192.168.0.14:3333";
// const url = "https://jsonplaceholder.typicode.com/users/1";
// const url = "10.0.2.2/user/1";

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

Future<List<Debt>> getDebtsByPaymentId(int? id) async {
  try {
    final response = await http.get(Uri.parse("$url/debts/payment/$id"));

    if (response.statusCode == 200) {
      var debts = jsonDecode(response.body).cast<Map<String, dynamic>>();

      return debts.map<Debt>((json) => Debt.fromJson(json)).toList();
    } else {
      throw Exception(response.body);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

Future<User> getUser(int id) async {
  var parsedUrl = Uri.parse("$url/user/$id");
  // final response =
  //     await http.get(Uri.parse("http://192.168.0.15:3333/user/$id"));

  final response = await http.get(parsedUrl);

  if (response.statusCode == 200) {
    var user = User.fromJson(jsonDecode(response.body));
    return user;
  } else {
    throw Exception("Could not load the data");
  }
}

Future<http.Response> createUser(UserDTO user) async {
  var response = await http.post(
    Uri.parse("$url/user"),
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'email': user.email,
      'name': user.name,
      'password': user.password,
      'wage': user.wage.toString(),
    }),
  );

  return response;
}

Future<http.Response> userLogin(String username, String password) async {
  var parsedUrl = Uri.parse("$url/login");

  var response = await http.post(
    parsedUrl,
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  return response;
}

Future<Payment> userPayment(int id) async {
  DateTime currentMonth = DateTime.now();
  String parsedDate =
      "${currentMonth.month > 9 ? currentMonth.month : "0${currentMonth.month}"}-01-${currentMonth.year}";
  var parsedUrl = Uri.parse("$url/payments/$id?date=$parsedDate");

  var response = await http.get(parsedUrl);

  if (response.statusCode == 200) {
    if (response.body.length > 4) {
      return Payment.fromJson(jsonDecode(response.body));
    } else {
      return Payment(
          id: 1,
          userId: 0,
          userReceived: "0",
          debtValue: "0",
          date: DateTime.now().toString(),
          paid: true);
    }
  } else {
    throw Exception(response.body);
  }
}

Future<http.Response> createDebt(Debt debt) async {
  try {
    var response = await http.post(
      Uri.parse("$url/debt"),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'value': double.parse(debt.value),
        'description': debt.description,
        'startAt': DateTime.now().toString(),
        'userId': debt.userId
      }),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response.body.toString());
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}
