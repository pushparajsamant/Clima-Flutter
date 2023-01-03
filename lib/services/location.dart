import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getLocation() async {
    LocationPermission permission;
    try {
      permission = await Geolocator.requestPermission();
      //Get the current location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      this.latitude = position.latitude;
      this.longitude = position.longitude;
      return;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
