import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/models/call.dart';
import 'package:lapidado/models/message.dart';

class FirebaseNetwork{
  FirebaseFirestore firestore=FirebaseFirestore.instance;



  Stream<Call>getCall(Call call){

    return firestore.collection("calls").doc(call.id).snapshots().map((event) => Call.fromJson(event.data()!));

  }
  Stream<List<Message>>chatStream(barberId){

    return firestore.collection("messages").where("clientId",isEqualTo: controller.final_user.id).where("barberId",isEqualTo: barberId).orderBy("data").snapshots().map((event) => event.docs.map((e) => Message.fromJson(e.data())).toList());
  }
  sendMessage(Message message)async{

    await firestore.collection("messages").add(message.toJson());
  }
}