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

  Schedule(
      {this.id,
        this.locationDescription,
        this.longitude,
        this.clientId,
      this.latitude,
        this.createDate,
      this.markedDate,
      this.markedTime,
      this.whereIs});

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
  });
  }
}
