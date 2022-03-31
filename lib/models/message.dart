class Message{
  var author;
  var text;
  var data;
  var  userId;
  var prestadorId;


  Message({this.text,this.author,this.userId,this.prestadorId,this.data});

  factory Message.fromJson(Map<String,dynamic>json){


    return Message(author: json["author"],text: json["text"],userId:json["userId"],prestadorId: json["prestadorId"],data: json["data"]);
  }
  toJson(){


    return ({
      "text":text,
      "author":author,
      "userId":userId,
      "prestadorId":prestadorId,
      "data":data

    });
  }
}