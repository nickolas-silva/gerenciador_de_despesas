import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gd_app/view/colors.dart';
import 'package:intl/intl.dart';
import '../models/despesa.dart';

class cardDespesa extends StatelessWidget {
  const cardDespesa({super.key, required this.despesa, required this.onDelete});


  final Despesa despesa;
  final Function(Despesa) onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        actionExtentRatio: 0.25,
        actionPane: const SlidableBehindActionPane(),
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            caption: 'Deletar',
            onTap: () {
              onDelete(despesa);
            },
          )
        ],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: branco
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(DateFormat('dd/MMM/yy - HH:mm').format(despesa.date),
              style: TextStyle(
                fontSize: 12
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text('Titulo: ${despesa.title}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
              ),
              Text('Valor: ${despesa.valor} R\$', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
            ],
          ),
        ),
      ),
      
    );
  }
}