import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gd_app/view/colors.dart';
import 'package:gd_app/widgets/widgetformfield.dart';
import 'package:gd_app/widgets/widgettext.dart';
import 'package:validatorless/validatorless.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: roxoForte,
      appBar: AppBar(
        title: const Text("Registrar Usuário"),
        centerTitle: true,
        backgroundColor: roxoForte,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  
                  child: WidgetText(
                    text: 'Nome',
                    size: 16,
                    weight: FontWeight.w600,
                    color: azul,

                  )
                ),
                WidgetTextFormField(
                  label: "nome",
                  textEditingController: nameController,
                  color: Colors.white,
                  icon: Icons.person,
                  hint: "Digite seu nome",
                  validator: Validatorless.multiple([
                    Validatorless.required("Nome obrigatório!"),
                    Validatorless.max(100, "Nome muito grande"),
                  ]),
                ),

                const SizedBox(height: 15,),

                Align(
                    alignment: Alignment.centerLeft,
                    child: WidgetText(
                      text: 'Email',
                      size: 16,
                      weight: FontWeight.w600,
                      color: azul,
                    )),
                WidgetTextFormField(
                  label: "Email",
                  textEditingController: emailController,
                  color: Colors.white,
                  icon: Icons.email,
                  hint: "Digite seu email",
                  validator: Validatorless.multiple([
                    Validatorless.required("Email obrigatório!"),
                    Validatorless.max(100, "Email muito grande!"),
                    Validatorless.email("Email em formato incorreto!")
                  ]),
                ),

                const SizedBox(
                  height: 15,
                ),

                Align(
                    alignment: Alignment.centerLeft,
                    child: WidgetText(
                      text: 'Senha',
                      size: 16,
                      weight: FontWeight.w600,
                      color: azul,
                    )),
                WidgetTextFormField(
                  label: "Senha",
                  color: Colors.white,
                  obscure: true,
                  textEditingController: passwordController,
                  icon: Icons.password,
                  hint: "Digite sua senha",
                  validator: Validatorless.multiple([
                    Validatorless.required("Nome obrigatório!"),
                    Validatorless.max(100, "Nome muito grande"),
                    Validatorless.min(6, "Senha muit curta"),
                    Validatorless.compare(
                        passwordConfirmController, "As Senhas preciam ser iguais")
                  ]),
                ),

                const SizedBox(
                  height: 15,
                ),

                Align(
                    alignment: Alignment.centerLeft,
                    child: WidgetText(
                      text: 'Confirmar Senha',
                      size: 16,
                      weight: FontWeight.w600,
                      color: azul,
                    )),
                WidgetTextFormField(
                  label: "Confirme sua senha",
                  color: Colors.white,
                  obscure: true,
                  textEditingController: passwordConfirmController,
                  icon: Icons.password,
                  hint: "confirme sua senha",
                  validator: Validatorless.multiple([
                    Validatorless.required("Nome obrigatório!"),
                    Validatorless.max(100, "Nome muito grande"),
                    Validatorless.min(6, "Senha muito curta"),
                    Validatorless.compare(
                        passwordController, "As Senhas preciam ser iguais")
                  ]),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    final validation = key.currentState?.validate() ?? false;
                    if (validation) Navigator.pop(context);
                  },
                  // Cadastrar
                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: roxoClaro,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
