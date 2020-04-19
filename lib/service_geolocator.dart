import 'package:geolocator/geolocator.dart';

class GeoLocatorService{
  Future<Position> getGeoLocation() async {
    var geolocator = Geolocator();
    return await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high, locationPermissionLevel: GeolocationPermission.location);
  }
}