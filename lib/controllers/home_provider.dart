import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app_test/endPoints.dart';
import 'package:map_app_test/models/marker.dart';
import 'package:map_app_test/models/users_model.dart';
import 'package:map_app_test/servicess/api_service.dart';
import 'package:map_app_test/utils/location_utils.dart';

class HomeProvider with ChangeNotifier {
  GoogleMapController? mapController;
  Position? userLocation;
  List<Marker> markers = [];
  List<UserModel> users = [];
  bool isLoadingMarkers = true;
  bool? isLoadingUserLocation;
  bool? isLoadingAutoComplete;
  bool isLoadingDistances = false;

  final LatLng center = const LatLng(26.8206, 30.8025);

  setUsersList(List<UserModel> usersList) {
    users.addAll(usersList);
    notifyListeners();
  }

  getUsersList() async {
    changeIsLoadingMarkersState(true);
    ApiService api = ApiService();

    await api
        .request(
      EndPoints.getUsersUrl,
      'GET',
    )
        .then((users) {
      if (users != null) {
        // ignore: avoid_print
        print("users is : $users");
        return users;
      } else {
        return [];
      }
    });
    changeIsLoadingMarkersState(false);
  }

  changeIsLoadingMarkersState(state) {
    isLoadingMarkers = state;
    notifyListeners();
  }

  changeIsLoadingUserLocation(state) {
    isLoadingUserLocation = state;
    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) async {
    getUsersList();

    /// Get Venue Markers
    /// animate the map to the user location
    mapController = controller;
    _getVenueGeoJson();
    // ignore: avoid_print
    print('/// On Map Created');
    userLocation = await LocationUtils.getUserLocation();
    // ignore: avoid_print
    print('/// Get User Location');
    // ignore: avoid_print
    print(userLocation);

    if (userLocation != null) {
      LocationUtils.mapAnimateToLocation(
          mapController!, userLocation!.latitude, userLocation!.longitude);
    }
    ChangeNotifier();
  }

  mapAnimateToUserLocation() async {
    if (userLocation == null) {
      userLocation = await LocationUtils.getUserLocation();

      if (userLocation != null) {
        mapAnimateToLocation(userLocation!);
      }
    } else {
      mapAnimateToLocation(userLocation!);
    }
  }

  /// Get Vendor Geo Json
  _getVenueGeoJson() async {
    List<LocaleMarker> markersLocale = [
      LocaleMarker(id: "1", lat: 30.2869136, lng: 31.0164114),
      LocaleMarker(id: "2", lat: 30.3869137, lng: 31.1164115),
      LocaleMarker(id: "3", lat: 30.4869138, lng: 31.2164116),
      LocaleMarker(id: "4", lat: 30.2569136, lng: 31.3164114),
      LocaleMarker(id: "5", lat: 30.3369137, lng: 31.4164115),
      LocaleMarker(id: "6", lat: 30.4269138, lng: 31.5164116),
    ];

    for (int i = 0; i < markersLocale.length; i++) {
      markers.add(
        Marker(
            markerId: MarkerId("${markersLocale[i].id}"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen,
            ),
            position: LatLng(markersLocale[i].lat!, markersLocale[i].lng!)),
      );
    }
    changeIsLoadingMarkersState(false);

    // changeIsLoadingMarkersState(true);
    // features = await ApiServices().getVenueGeoJson();
    // for (int i = 0; i < features.length; i++) {
    //   markers.add(
    //     Marker(
    //       icon: features[i].properties.cashBackIsActive
    //           ? fuelIconWithCashBack
    //           : fuelIconNoCashBack,
    //       markerId: MarkerId('$i'),
    //       infoWindow: InfoWindow(
    //           title: features[i].properties.name,
    //           snippet:
    //               features[i].properties.address ?? stationDidNotPutAddress.tr),
    //       position: LatLng(
    //         features[i].geometry.coordinates[0].toDouble(),
    //         features[i].geometry.coordinates[1].toDouble(),
    //       ),
    //       onTap: () {
    //         featureToInject = features[i];
    //         stationLocationToInject = LatLng(
    //           features[i].geometry.coordinates[0].toDouble(),
    //           features[i].geometry.coordinates[1].toDouble(),
    //         );
    //         userLocationToInject = userLocation;
    //         Get.to(() => StationView());
    //       },
    //     ),
    //   );
    // }
    // changeIsLoadingMarkersState(false);
    notifyListeners();
  }

  Set<Circle> circles = Set.from([
    Circle(
      circleId: CircleId("1"),
      center: const LatLng(23.8859, 45.0792),
      radius: 4000,
    )
  ]);

  mapAnimateToLocation(Position? location, {zoom = 12}) {
    if (location != null) {
      LocationUtils.mapAnimateToLocation(
          mapController!, location.latitude, location.longitude);
    }

    notifyListeners();
  }
}
