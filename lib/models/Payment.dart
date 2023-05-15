import 'package:flutter/foundation.dart';

class Payment {
  final int id;
  final int userId;
  final String userReceived;
  final String debtValue;
  final String date;
  final bool paid;

  Payment({
    required this.id,
    required this.userId,
    required this.userReceived,
    required this.debtValue,
    required this.date,
    required this.paid,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      userId: json['userId'],
      userReceived: json['userReceived'],
      debtValue: json['debtValue'],
      date: json['date'],
      paid: json['paid'],
    );
  }
}
