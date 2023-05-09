import 'package:flutter/foundation.dart';

class Payment {
  final int id;
  final int user_id;
  final double userDebt;
  final double debtValue;
  final DateTime date;
  final bool paid;

  Payment({
    required this.id,
    required this.user_id,
    required this.userDebt,
    required this.debtValue,
    required this.date,
    required this.paid,
  });

  factory Payment.toJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      user_id: json['user_id'],
      userDebt: json['userDebt'],
      debtValue: json['debtValue'],
      date: json['date'],
      paid: json['paid'],
    );
  }
}
