import 'package:location/location.dart';

class LocationController {
  var currentLocation;
  Location location = new Location();

  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  Future<LocationData?> getUserCurrentLocation() async {
    _permissionGranted = await location.hasPermission();

      if (_permissionGranted == PermissionStatus.granted) {
        _locationData = await location.getLocation();
      }else{


    }

    return await _locationData;
  }
}
