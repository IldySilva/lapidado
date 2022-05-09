import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/controllers/network/FirebaseNetwork.dart';
import 'package:lapidado/models/call.dart';
import 'package:lapidado/models/message.dart';
import 'package:lapidado/view/customWidgets/input.dart';

class ChatScreen extends StatefulWidget {
  Call call;
  ChatScreen(this.call);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msgController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors().azul,
          centerTitle: true,
          title: Text(widget.call.barberName + " - Barbeiro"),
        ),
        body: Container(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: StreamBuilder<List<Message>>(
                    initialData: const [],
                    stream: FirebaseNetwork().chatStream(widget.call.barberId),
                    builder: (a, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Algo de errado aconteceu,reinicie');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: const CircularProgressIndicator());
                      }
                      if(snapshot.data!.isEmpty)
                        return Center(child: Text("Mensagens"),);
                      return SingleChildScrollView(child: Column(children: [

                        SizedBox(height: Get.height*0.03,),
                        for(Message c in snapshot.data??[])
                          BubbleSpecialThree(
                            text: c.text,

                            color:c.author!=widget.call.clientId? CustomColors().azul:Colors.grey,
                            tail: false,
                            isSender: c.author==widget.call.clientId,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),


                          )],),);
                    }),
              ),

              Row(children: [

                SizedBox(width: Get.width*.04),
                Container(width: Get.width*0.7,child:     CustomInput().textFields(label:"Escreve a sua mensagem aqui",controller:  msgController),),

                IconButton(onPressed: (){
                  Message message=Message(text: msgController.text);
                  _sendMessage(message);


                }, icon: Icon(Icons.send,color: Colors.black,)
                )
              ],),
              SizedBox(height: Get.height*0.02,)
            ],
          ),
        ),
      ),
    );
  }

  _sendMessage(Message message){
    message.author=controller.final_user.id;
    message.userId=controller.final_user.id;
    message.prestadorId=widget.call.barberId;
    message.data=DateTime.now();
   setState(() {
     msgController.clear();
   });
    FirebaseNetwork().sendMessage(message);
  }
}
