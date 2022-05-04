import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/controllers/location.dart';
import 'package:lapidado/interfaces/auth_interfaces.dart';
import 'package:lapidado/Domain/Entities/user.dart';
import 'package:lapidado/view/Authentication/login_screen.dart';

import 'package:lapidado/view/customWidgets/buttons.dart';
import 'package:lapidado/view/customWidgets/decoration.dart';
import 'package:lapidado/view/customWidgets/input.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final user = User();

class _RegisterScreenState extends State<RegisterScreen> {
  var currentLocation;

  init() async {
    currentLocation = await LocationController().getUserLocation();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomDecorations().space(5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Olá,\nBem vindo",
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CustomDecorations().space(2),
                                  Container(
                                      width: Get.width * 0.4,
                                      child: Text(
                                          "Preencha os Dados de Acesso e Prossiga")),
                                ],
                              ),
                              CircleAvatar(
                                radius: Get.height * 0.06,
                                backgroundColor: Colors.grey.withOpacity(.1),
                                child: Container(
                                  width: Get.width * 0.22,
                                  height: Get.width * 0.2,
                                  child: Hero(
                                    tag: "logoHero",
                                    child: Image.asset("assets/01.png"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomDecorations().space(5),
                      CustomInput().textFields(
                          label: "Nome de Utilizador",
                          controller: controller.nameEditingController,
                          icon: Icons.person_outlined),
                      CustomDecorations().space(2),
                      CustomInput().textFields(
                          label: "Telefone",
                          controller: controller.phoneEditingController,
                          icon: Icons.phone_android,keys: TextInputType.phone),
                      CustomDecorations().space(2),
                      CustomInput().textFields(
                          label: "Senha",
                          controller: controller.pwdEditingController,
                          icon: Icons.security,
                          obscureText: true),
                      CustomDecorations().space(2),
                      CustomInput().textFields(
                          label: "Municipio/Bairro",
                          controller: controller.locationEditingController,
                          icon: Icons.location_on),
                      CustomDecorations().space(2),
                      CustomButtons().mainButton(
                          label: "Criar Conta",
                          onPress: () {
                            user.username =
                                controller.nameEditingController.text;
                            user.phoneNumber =
                                controller.phoneEditingController.text;
                            user.password =
                                controller.pwdEditingController.text;
                            user.locationDescription =
                                controller.locationEditingController.text;
                            user.latitude = currentLocation.latitude;
                            user.longitude = currentLocation.longitude;
                            IAuth().createAccount(user);
                          }),
                      CustomDecorations().space(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Já tem uma conta?"),
                          GestureDetector(
                              onTap: () {
                                Get.to(LoginScreen());
                              },
                              child: Text(
                                " Entre",
                                style: TextStyle(
                                    color: CustomColors().vermelha,
                                    fontWeight: FontWeight.w700),
                              )),
                        ],
                      ),
                      CustomDecorations().space(2),
                    ]),
              ),
            )));
  }
}
