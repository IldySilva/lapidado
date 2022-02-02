import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/view/Authentication/login.dart';
import 'package:lapidado/view/customWidgets/buttons.dart';
import 'package:lapidado/view/customWidgets/decoration.dart';
import 'package:lapidado/view/customWidgets/input.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          CustomDecorations().space(5),
          Column(
            children: [
              CircleAvatar(radius: Get.height*0.07,backgroundColor: Colors.grey.withOpacity(.3),
              child:  Container(
                width: Get.width * 0.22,
                height: Get.width * 0.22,
                child: Hero(
                  tag: "logoHero",
                  child: Image.asset("assets/01.png"),
                ),
              ),
              ),
          GestureDetector(
              onTap: ()async {
                final ImagePicker picker=ImagePicker();
                XFile? image=await picker.pickImage(source: ImageSource.gallery);
                if(image!=null) {
                  controller.base64ImageSelected.value=HelpersFuntions().imageToBase64(await image.readAsBytes());
                }
              },
              child: const Text("Selecionar Foto"))
            ],
          ),          CustomDecorations().space(2),

          const Text(
            "Preencha os dados e prossiga",
            style: TextStyle(fontSize: 16),
          ),
          CustomDecorations().space(2),
          CustomInput().textFields(label: "Nome de Utilizador"),
          CustomDecorations().space(2),
          CustomInput().textFields(label: "Telefone"),
          CustomDecorations().space(2),
          CustomInput().textFields(label: "Senha"),
          CustomDecorations().space(2),
          CustomInput().textFields(label: "País - Provincia -Municipio/Bairro"),
          CustomDecorations().space(2),

          GestureDetector(
              onTap: () => Get.off(LoginScreen()),
              child: Text(
                "Pegar minha localização atual",
                style: TextStyle(
                    color: CustomColors().vermelha,
                    fontWeight: FontWeight.w700),
              )),
          CustomDecorations().space(6),
          CustomButtons().mainButton(label: "Criar Conta"),
          CustomDecorations().space(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Já tem uma conta?"),
              GestureDetector(
                  onTap: () => Get.off(LoginScreen()),
                  child: Text(
                    "Entre",
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
