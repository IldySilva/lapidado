
class Call{
  var id;
  var clientId;
  var barberId;
  var isCalling;
  var answered;
  var createdDateTime;
  var serviceDescription;
  var scheduleDateTime;
  var barberLatitude;
  var clientPhoneNumber;
  var clientName;
  var barberLongitude;
  var clientLongitude;
  var clientLatitude;
  var locationDescription;
  var wayToPay;
  var barberName;
  var selectedPrice;

  Call(
      {this.isCalling,
        this.answered,
        this.clientLongitude,
        this.clientName,
        this.scheduleDateTime,
        this.clientLatitude,
        this.clientId,
        this.barberId,
        this.serviceDescription,

        this.locationDescription,
        this.wayToPay,
        this.barberLongitude,
        this.selectedPrice,
        this.barberName,
        this.barberLatitude,
        this.clientPhoneNumber,
        this.id,
        this.createdDateTime});

  Call.fromJson(Map<String, dynamic> json) {
    isCalling = json['isCalling'];
    answered = json['answered'];
    barberName=json["barberName"];
    clientName=json["clientName"];
    selectedPrice=json["selectedPrice"];
    clientLongitude = json['clientLongitude'];
    clientPhoneNumber=json["clientPhoneNumber"];
    scheduleDateTime = json['schuduleDateTime'];
    clientLatitude = json['clientLatitude'];
    clientId = json['clientId'];
    barberId = json['barberId'];
    id=json["id"];
    serviceDescription=json["serviceDescription"];
    locationDescription = json['locationDescription'];
    barberLongitude = json['barberLongitude'];
    barberLatitude = json['barberLatitude'];
    createdDateTime = json['createdDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isCalling'] = this.isCalling;
    data['answered'] = this.answered;
    data["selectedPrice"]=this.selectedPrice;
    data['clientLongitude'] = this.clientLongitude;
    data['schuduleDateTime'] = this.scheduleDateTime;
    data['clientLatitude'] = this.clientLatitude;
    data['clientId'] = this.clientId;
    data["serviceDescription"]=this.serviceDescription;
    data["clientPhoneNumber"]=this.clientPhoneNumber;
    data['barberId'] = this.barberId;
    data["barberName"]=this.barberName;
    data['locationDescription'] = this.locationDescription;
    data['barberLongitude'] = this.barberLongitude;
    data['barberLatitude'] = this.barberLatitude;
    data['createdDateTime'] = this.createdDateTime;
    data["clientName"]=  clientName;

    return data;
  }


}