import 'dart:convert';
import '../models/Debt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

const despesaListkey = 'despesas_list';

class DespesaRepository {
  late SharedPreferences sharedPreferences;

  Future<List<Debt>> getDespesaList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString =
        sharedPreferences.getString(despesaListkey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Debt.fromJson(e)).toList();
  }

  void saveDespesaList(List<Debt> despesas) {
    final jsonString = json.encode(despesas);
    sharedPreferences.setString(despesaListkey, jsonString);
  }
}
