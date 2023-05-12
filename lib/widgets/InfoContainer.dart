import 'package:flutter/cupertino.dart';
import 'package:gd_app/models/Payment.dart';
import 'package:gd_app/models/User.dart';
import 'package:intl/intl.dart';

class InfoContainer extends StatefulWidget {
  const InfoContainer({Key? key, required this.payment}) : super(key: key);

  final Payment payment;

  @override
  State<StatefulWidget> createState() {
    return _InfoWidgetState();
  }
}

class _InfoWidgetState extends State<InfoContainer> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var month = DateFormat("MMMM").format(now).toString();

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 40),
      padding: const EdgeInsets.all(12),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(66, 0, 0, 0),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$month - ${now.year}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 12),
          Text(
            "Meta - R\$${widget.payment.userReceived}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          Text(
            "Gasto - R\$${widget.payment.debtValue}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
