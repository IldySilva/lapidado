import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/interfaces/auth_interfaces.dart';
import 'package:lapidado/view/customWidgets/buttons.dart';
import 'package:lapidado/view/customWidgets/decoration.dart';
import 'package:lapidado/view/customWidgets/input.dart';
import 'package:lapidado/view/Authentication/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          CustomDecorations().space(5),
          Container(
              width: Get.width * 0.4,
              height: Get.width * 0.4,
              child:
                  Hero(tag: "logoHero", child: Image.asset("assets/01.png"))),
          const Text(
            "Bem-vindo",
            style: TextStyle(fontSize: 16),
          ),
          CustomDecorations().space(10),
          CustomInput().textFields(
              label: "Telefone", controller: controller.phoneEditingController,icon:Icons.phone_android),
          CustomDecorations().space(2),
          CustomInput().textFields(
              label: "Senha", controller: controller.pwdEditingController,icon:Icons.security_outlined),
          CustomDecorations().space(3),
          CustomButtons().mainButton(
              label: "Entrar",
              onPress:()=> IAuth().tryLogin(
                  controller.phoneEditingController.text,
                  controller.pwdEditingController.text)),
          CustomDecorations().space(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Não tem uma conta?"),
              GestureDetector(
                  onTap: () => Get.to(RegisterScreen()),
                  child: Text(
                    "Registe-se",
                    style: TextStyle(
                        color: CustomColors().vermelha,
                        fontWeight: FontWeight.w700),
                  ))
            ],
          )
        ]),
      ),
    )));
  }
}
