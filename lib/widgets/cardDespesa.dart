import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gd_app/models/Debt.dart';
import 'package:gd_app/view/colors.dart';
import 'package:intl/intl.dart';
import '../models/despesa.dart';

class cardDespesa extends StatelessWidget {
  const cardDespesa({super.key, required this.debt});

  final Debt debt;
  // final Function(Debt) onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        actionExtentRatio: 0.25,
        actionPane: const SlidableBehindActionPane(),
        // secondaryActions: [
        //   IconSlideAction(
        //     color: Colors.red,
        //     icon: Icons.delete,
        //     caption: 'Deletar',
        //     onTap: () {
        //       onDelete(debt);
        //     },
        //   )
        // ],
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: branco),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MMM/yy - HH:mm').format(debt.date),
                style: TextStyle(fontSize: 12),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  'Titulo: ${debt.description}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                'Valor: ${debt.value} R\$',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
