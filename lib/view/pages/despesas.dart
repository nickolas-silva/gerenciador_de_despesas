import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gd_app/models/despesa.dart';
import 'package:gd_app/repositories/despesa_repository.dart';
import 'package:gd_app/view/colors.dart';
import 'package:gd_app/widgets/widgettext.dart';

import '../../widgets/cardDespesa.dart';

class TabDespesa extends StatefulWidget {
  const TabDespesa({super.key});

  @override
  State<TabDespesa> createState() => _TabDespesaState();
}

class _TabDespesaState extends State<TabDespesa> {
  final TextEditingController despesaController = TextEditingController();
  final DespesaRepository despesaRepository = DespesaRepository();

  List<Despesa> despesas = [];
  Despesa? deletedDespesa;
  int? deletedpos;
  String? errorMsg;

  @override
  void initState() {
    super.initState();

    despesaRepository.getDespesaList().then((value) {
      setState(() {
        despesas = value.cast<Despesa>();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: WidgetText(
                  text: 'Despesa Mensal',
                  weight: FontWeight.w800,
                  size: 24,
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(66, 0, 0, 0),
                        spreadRadius: 1,
                        blurRadius: 15)
                  ]),
              child: WidgetText(
                text: "R\$ 1000,00",
                weight: FontWeight.w700,
                size: 20,
                color: Colors.green,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: despesaController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Digite o titulo da despesa",
                      errorText: errorMsg,
                      labelStyle: TextStyle(color: roxoClaro)),
                )),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    String text = despesaController.text;

                    if (text.isEmpty) {
                      setState(() {
                        errorMsg = 'O titulo não pode ser vazio';
                      });
                      return;
                    }
                    setState(() {
                      Despesa newDespesa = Despesa(
                          title: text, date: DateTime.now(), valor: 100 //teste
                          );
                      despesas.add(newDespesa);
                      errorMsg = null;
                    });
                    despesaController.clear();
                    despesaRepository.saveDespesaList(despesas);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: roxoForte, padding: EdgeInsets.all(14)),
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (Despesa despesa in despesas)
                    cardDespesa(
                      despesa: despesa,
                      onDelete: onDelete,
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onDelete(Despesa despesa) {
    deletedDespesa = despesa;
    deletedpos = despesas.indexOf(despesa);

    setState(() {
      despesas.remove(despesa);
    });
    despesaRepository.saveDespesaList(despesas);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Tarefa ${despesa.title} foi removida com sucesso!',
        style: TextStyle(color: Color(0xff060708)),
      ),
      backgroundColor: Colors.white,
      action: SnackBarAction(
        label: 'Desfazer',
        textColor: const Color(0xff00d7f3),
        onPressed: () {
          setState(() {
            despesas.insert(deletedpos!, deletedDespesa!);
          });
          despesaRepository.saveDespesaList(despesas);
        },
      ),
      duration: const Duration(seconds: 5),
    ));
  }

  void showDeletedConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Limpar Tudo?'),
        content: Text('Você tem certeza que deseja apagar todas as despesas?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(primary: Color(0xff00d7f3)),
              child: Text('Cancelar')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                deleteAll();
              },
              style: TextButton.styleFrom(primary: Colors.red),
              child: Text('Limpar Tudo'))
        ],
      ),
    );
  }

  void deleteAll() {
    setState(() {
      despesas.clear();
    });
    despesaRepository.saveDespesaList(despesas);
  }
}
