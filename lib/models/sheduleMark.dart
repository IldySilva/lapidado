class Schedule {
  var id;
  var createDate;
  var markedDate;
  var markedTime;
  var whereIs;
  var clientId;
  var locationDescription;
  var latitude;
  var longitude;
  var hairCutId;
  var hairCutPrice;
  var hairCutName;
  var hairCutDesc;
  Schedule(
      {this.id,
        this.locationDescription,
        this.longitude,
        this.clientId,
      this.latitude,
        this.createDate,
      this.markedDate,
      this.markedTime,
      this.whereIs,this.hairCutDesc,this.hairCutId,this.hairCutName,this.hairCutPrice

      });

Map<String,dynamic>toJson(){
  return ({
    "markedDate":markedDate,
    "locationDescription":locationDescription,
    "clientId":clientId,
    "createDate":DateTime.now().toIso8601String(),
    "markedTime":markedTime,
    "whereIs":whereIs,
    "longitude":longitude,
    "latitude":latitude,
    "hairCutPrice":hairCutPrice,
    "hairCutDesc":hairCutDesc,
    "hairCutId":hairCutId,
    "hairCutName":hairCutName
  });
  }
  Schedule.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    markedDate = json['markedDate'];
    whereIs = json['whereIs'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    hairCutDesc = json['hairCutDesc'];
    hairCutPrice = json['hairCutPrice'];
    createDate = json['createDate'];
    id = json['id'];
    hairCutId = json['hairCutId'];
    markedTime = json['markedTime'];
    locationDescription = json['locationDescription'];
    hairCutName = json['hairCutName'];
  }

}
