import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gd_app/models/despesa.dart';
import 'package:gd_app/repositories/despesa_repository.dart';
import 'package:gd_app/view/colors.dart';
import 'package:gd_app/widgets/widgetformfield.dart';
import 'package:gd_app/widgets/widgettext.dart';

import '../../widgets/cardDespesa.dart';

class TabDespesa extends StatefulWidget {
  const TabDespesa({super.key});

  @override
  State<TabDespesa> createState() => _TabDespesaState();
}

class _TabDespesaState extends State<TabDespesa> {
  final TextEditingController despesaController = TextEditingController();
  final TextEditingController valorController = TextEditingController();
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
        despesas = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        child: Container(
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
                width: MediaQuery.of(context).size.width,
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
                  align: TextAlign.center,
                ),
              ),
          
              const SizedBox(height: 30,),
          
              Align(
                alignment: Alignment.centerLeft,
                child: WidgetText(
                  text: 'Despesas',
                  weight: FontWeight.w800,
                  size: 24,
                )
              ),
          
              const SizedBox(height: 8,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      
                      onPressed: () {
                        // String text = despesaController.text;
                  
                        // if(text.isEmpty){
                        //   setState(() {
                        //     errorMsg = 'O titulo não pode ser vazio';
                  
                        //   });
                        //   return;
                        // }
                        // setState(() {
                        //   Despesa newDespesa = Despesa(
                        //     title: text,
                        //     date: DateTime.now(),
                        //     valor: 100  //teste
                        //   );
                        //   despesas.add(newDespesa);
                        //   errorMsg = null;
                        // });
                        // despesaController.clear();
                        // despesaRepository.saveDespesaList(despesas);
                        showDialog(
                            context: context,
                            builder: (context) => Wrap(
                              children:[ AlertDialog(
                                    backgroundColor: roxoForte,
                                    title: const Text(
                                      'Cadastrar Nova Despesa',
                                      style: TextStyle(
                                        color: azul,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        
                                        TextField(
                                          controller: despesaController,
                                          style: const TextStyle(
                                            color: Colors.white
                                          ),
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            labelText: "Titulo da Despesa",
                                            errorText: errorMsg,
                                            labelStyle: const TextStyle(
                                                color: azul,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                            fillColor: roxoMedio,
                                            filled: true,
                                            prefixIcon: const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 0, right: 0),
                                              child: Icon(
                                                Icons.title,
                                                color: azul,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                    
                                        const SizedBox(
                                          height: 15,
                                        ),
                                    
                                        TextField(
                                          controller: valorController,
                                          style: const TextStyle(
                                            color: Colors.white
                                          ),
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            labelText: "Valor da Despesa",
                                            errorText: errorMsg,
                                            labelStyle: const TextStyle(
                                                color: azul,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
                                              ),
                                            fillColor: roxoMedio,
                                            filled: true,
                                            prefixIcon: const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 0, right: 0),
                                              child: Icon(
                                                Icons.monetization_on_rounded,
                                                color: azul,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor: roxoMedio),
                                              onPressed: (() {
                                                String text = despesaController.text;
                                                String valor = valorController.text;
                              
                                                if (text.isEmpty && valor.isEmpty) {
                                                  setState(() {
                                                    errorMsg =
                                                        'Os campos não podem ser vazios!';
                                                  });
                                                  return;
                                                }
                              
                                                setState(() {
                                                  Despesa newDespesa = Despesa(
                                                      title: text,
                                                      date: DateTime.now(),
                                                      valor: valor);
                                                  despesas.add(newDespesa);
                                                  errorMsg = null;
                                                });
                              
                                                despesaController.clear();
                                                valorController.clear();
                                                despesaRepository
                                                    .saveDespesaList(despesas);
                                                Navigator.pop(context);
                                              }),
                                              child: WidgetText(
                                                text: 'Cadastrar',
                                                color: Colors.white,
                                                weight: FontWeight.w900,
                                              )),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          TextButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor: branco),
                                              onPressed: () {
                                                despesaController.clear();
                                                valorController.clear();
                                                Navigator.pop(context);
                                              },
                                              child: WidgetText(
                                                text: 'Cancelar',
                                                weight: FontWeight.w700,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),]
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: roxoForte, padding: EdgeInsets.all(14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                         
          
                      ),
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                  
                        ),
                        
                      )
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Flexible(
                child: ListView(
                  scrollDirection: Axis.vertical,
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
