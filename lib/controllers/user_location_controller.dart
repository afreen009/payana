import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sidebaranimationflutter/models/user_location.dart';

class UserLocationController {
  static Future<LatLng> getCurrentLocation() async {
    Location location = Location();
    bool check = (await location.hasPermission()) as bool;
    if (!check) {
      bool result = (await location.requestPermission()) as bool;
      if (result) {
        LocationData position = await location.getLocation();
        return LatLng(position.latitude, position.longitude);
      }
    }
    return null;
  }

  static Future<List<UserLocation>> getSavedLocations() async {
    return [
      UserLocation.named(
          name: "Home",
          locationType: UserLocationType.Home,
          position: LatLng(0, 0),
          minutesFar: 52),
      UserLocation.named(
          name: "Innov8",
          locationType: UserLocationType.Office,
          position: LatLng(0, 0),
          minutesFar: 36),
    ];
  }
}
