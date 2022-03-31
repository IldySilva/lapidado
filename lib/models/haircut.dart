class Haircut {

  var name;
  var price;
  var description;
  var id;
  Haircut({this.price,this.description,this.id,this.name});
   factory Haircut.fromJson(Map<String,dynamic> json){
    return Haircut(price: json["price"],name:json["name"],description: json["description"],id: json["id"]);
  }

}