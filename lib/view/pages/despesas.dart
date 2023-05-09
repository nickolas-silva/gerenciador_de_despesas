import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gd_app/models/despesa.dart';
import 'package:gd_app/repositories/despesa_repository.dart';
import 'package:gd_app/view/colors.dart';

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
  void initState(){
    super.initState();

    despesaRepository.getDespesaList().then((value) {
      setState(() {
        despesas = value;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: branco,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(child: TextField(
                  controller: despesaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Digite o titulo da despesa",
                    errorText: errorMsg,
                    labelStyle: TextStyle(color: roxoClaro)
                  ),
                  
                )),

                SizedBox(width: 8,),

                ElevatedButton(
                  onPressed: () {
                    String text = despesaController.text;

                    if(text.isEmpty){
                      setState(() {
                        errorMsg = 'O titulo não pode ser vazio';

                      });
                      return;
                    }
                    setState(() {
                      Despesa newDespesa = Despesa(
                        title: text,
                        date: DateTime.now(),
                        valor: 100  //teste
                      );
                      despesas.add(newDespesa);
                      errorMsg = null;
                    });
                    despesaController.clear();
                    despesaRepository.saveDespesaList(despesas);
                  }, 
                  style: ElevatedButton.styleFrom(
                    primary: roxoForte,
                    padding: EdgeInsets.all(14)
                  ),
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                )
              ],
            ),

            SizedBox(height: 16,),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  for(Despesa despesa in despesas)
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

  void onDelete(Despesa despesa){
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

  void deleteAll(){
    setState(() {
      despesas.clear();
    });
    despesaRepository.saveDespesaList(despesas);
  }
}