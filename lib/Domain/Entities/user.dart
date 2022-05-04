class User {
  var id;
  var username;
  var imageUrl;
  var phoneNumber;
  var password;
  var location;
  var latitude;
  var longitude;
  var locationDescription;

  User(
      {this.password,
      this.latitude,
      this.longitude,
      this.location,
      this.locationDescription,
      this.phoneNumber,
      this.username,
      this.imageUrl,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    password = json['password'];
    longitude = json['longitude'];
    phoneNumber = json['phoneNumber'];
    latitude = json['latitude'];
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    return ({
      "id": id,
      "username": username,
      "password": password,
      "imageUrl": imageUrl,
      "phoneNumber": phoneNumber,
      "latitude": latitude,
      "longitude": longitude,
      "location": locationDescription,
    });
  }
}
