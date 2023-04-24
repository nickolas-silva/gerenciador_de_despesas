import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gd_app/view/colors.dart';
import 'package:gd_app/widgets/widgetformfield.dart';
import 'package:gd_app/widgets/widgettext.dart';
import 'package:validatorless/validatorless.dart';

class ViewLogin extends StatefulWidget {
  const ViewLogin({super.key});

  @override
  State<ViewLogin> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  late TextEditingController textEditingControllerEmail, textEditingControllerPassword;



  @override
  void initState(){
    textEditingControllerEmail = TextEditingController();
    textEditingControllerPassword = TextEditingController();
    textEditingControllerEmail.text = '';
    textEditingControllerPassword.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: roxoForte,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 172,),

              WidgetText(
                text: 'BEM VINDO(A)',
                color: azul,
                align: TextAlign.center,
                size: 24,
                weight: FontWeight.w900,
              ),

              const SizedBox(height: 35,),

              Align(
                alignment: Alignment.centerLeft,
                child: WidgetText(text: 'Login', color: branco, size: 20, weight: FontWeight.w900,)
              ),

              const SizedBox(height: 32,),

              WidgetTextFormField(
                label: 'Email',
                textEditingController: textEditingControllerEmail,
                icon: Icons.email,
                hint: 'Digite seu email',
                validator: Validatorless.email("Digite um email válido!"),

              ),

              const SizedBox(height: 40,),

              WidgetTextFormField(
                label: 'Senha', 
                textEditingController: textEditingControllerPassword,
                icon: Icons.password,
                hint: 'Digite sua senha',
                validator: Validatorless.min(6, "Digite no minimo 6 caracteres"),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: WidgetText(
                    text: 'Esqueceu a Senha?',
                    color: branco,
                    size: 16,
                    weight: FontWeight.w700,

                  )
                ),
              ),

              const SizedBox(height: 20,),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: roxoClaro,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                  
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetText(
                      text: 'Logar',
                      color: Colors.black,
                      size: 25,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      weight: FontWeight.w700,
                    )
                  ],
                ),
              ),

              const SizedBox(height: 36,),

              WidgetText(
                text: 'Não tem uma conta?',
                color: Colors.white,
                size: 20,
                weight: FontWeight.w700,
              ),

              TextButton(
              onPressed: () {
               //Rota tela de cadastro

              },
              child: Text(
                'Registre-se',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  //fontFamily: 'JetBrains Mono',
                  decoration: TextDecoration.underline,
                ),
              )
            )

            ],
          ),
          
        ),
        
      ),
      
    );
  }
}