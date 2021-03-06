import 'dart:async';

import 'package:location/location.dart';
import 'package:sidebaranimationflutter/services/user_location.dart';

class LocationService {
  //keep track of current Location
  UserLocation _currentLocation;
  var location = Location();

  //Continuously emit location updates
  StreamController<UserLocation> _locationController =
  StreamController<UserLocation>.broadcast();
  LocationService() {
    // Request permission to use location
//    location.requestPermission().then((granted) {
//      print(granted);
//      if (granted != null) {
//        // If granted listen to the onLocationChanged stream and emit over our controller
//        location.onLocationChanged.listen((locationData) {
//          if (locationData != null) {
//            _locationController.add(UserLocation(
//              latitude: locationData.latitude,
//              longitude: locationData.longitude,
//            ));
//          }
//        });
//      }
//    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }

    return _currentLocation;
  }
}