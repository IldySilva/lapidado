
class Call{
  var id;
  var clientId;
  var barberId;
  var isCalling;
  var answered;
  var createdDateTime;
  var scheduleDateTime;
  var barberLatitude;
  var clientPhoneNumber;
  var barberLongitude;
  var clientLongitude;
  var clientLatitude;
  var locationDescription;
  var wayToPay;

  Call(
      {this.isCalling,
        this.answered,
        this.clientLongitude,
        this.scheduleDateTime,
        this.clientLatitude,
        this.clientId,
        this.barberId,
        this.locationDescription,
        this.wayToPay,
        this.barberLongitude,
        this.barberLatitude,
        this.clientPhoneNumber,
        this.id,
        this.createdDateTime});

  Call.fromJson(Map<String, dynamic> json) {
    isCalling = json['isCalling'];
    answered = json['answered'];
    clientLongitude = json['clientLongitude'];
    clientPhoneNumber=json["clientPhoneNumber"];
    scheduleDateTime = json['schuduleDateTime'];
    clientLatitude = json['clientLatitude'];
    clientId = json['clientId'];
    barberId = json['barberId'];
    id=json["id"];
    locationDescription = json['locationDescription'];
    barberLongitude = json['barberLongitude'];
    barberLatitude = json['barberLatitude'];
    createdDateTime = json['createdDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isCalling'] = this.isCalling;
    data['answered'] = this.answered;
    data['clientLongitude'] = this.clientLongitude;
    data['schuduleDateTime'] = this.scheduleDateTime;
    data['clientLatitude'] = this.clientLatitude;
    data['clientId'] = this.clientId;
    data["clientPhoneNumber"]=this.clientPhoneNumber;
    data['barberId'] = this.barberId;
    data['locationDescription'] = this.locationDescription;
    data['barberLongitude'] = this.barberLongitude;
    data['barberLatitude'] = this.barberLatitude;
    data['createdDateTime'] = this.createdDateTime;
    return data;
  }


}