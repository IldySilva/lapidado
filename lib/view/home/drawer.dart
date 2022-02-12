import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/view/Authentication/login.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        SizedBox(height: 25,),
        CircleAvatar(child: Icon(Icons.person,color:Colors.white),backgroundColor: Colors.grey,radius: 25,),
ListTile(title: Text("Terminar Sessão"),onTap: (){
  Get.off(LoginScreen());

},)
      ],),

    );
  }
}
