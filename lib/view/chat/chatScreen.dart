import 'package:flutter/material.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/models/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  TextEditingController messageController = TextEditingController();
  ScrollController listController = ScrollController();
  var eu;
  var outro;
  var outroName;

  List<Message>msgs=[



  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                title: Text(
                  outroName??"Chat",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                      child:

                        Container(
                                padding: EdgeInsets.only(
                                    left: 14, right: 14, top: 10, bottom: 10),
                                child: Align(
                                  alignment: (Alignment.topLeft),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:CustomColors().vermelha.withOpacity(0.2)
                                    ),
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                     " Mensagens",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),

          )),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      textInputAction: TextInputAction.send,
                      onSubmitted: (text) => _sendMessage,
                      controller: messageController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(Icons.send), onPressed: _sendMessage),
                          hintText: "Escreva Aqui A sua Mensagem"),
                    ),
                  )
                ],
              )),
        ));
  }
}
_sendMessage(){

}
