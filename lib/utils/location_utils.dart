import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationUtils {
  static Position? _userLocation;
  static bool? serviceEnabled;
  static LocationPermission? permission;

  /// Location Package
  static getUserLocation() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {}

    print('/// Getting Location .......');
    _userLocation = await Geolocator.getCurrentPosition();
    print('√√√√√√√√√√√√√√√√√√√√√√√√√√√\n'
        '√√√√√√ USER LOCATION √√√√√√\n'
        '√√√√√√√√√√√√√√√√√√√√√√√√√√√');
    print(_userLocation);
    return _userLocation;
  }

  static mapAnimateToLocation(GoogleMapController mapController, lat, lng,
      {zoom = 12}) {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          bearing: 0.0,
          tilt: 0.0,
          zoom: zoom.toDouble(),
        ),
      ),
    );
  }
}
