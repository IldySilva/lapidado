class User{

  var username;
  var imageUrl;
  var phoneNumber;
  var password;
  var location;
  var latitude;
  var longitude;
  var locationDescription;

    Map<String,dynamic>toJson(){

    return ({
    "username":username,
      "password":password,
      "imageUrl":imageUrl,
      "phoneNumber":phoneNumber,
      "latitude":latitude,
      "longitude":longitude,
      "location":locationDescription,

    });
  }

}