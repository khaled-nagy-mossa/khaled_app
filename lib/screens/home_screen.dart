import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app_test/controllers/home_provider.dart';
import 'package:map_app_test/styles/styles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            /// #1
            /// Google Map
            GoogleMap(
              onMapCreated: homeProvider.onMapCreated,
              initialCameraPosition: const CameraPosition(
                target:
                    // LatLng(_userLocation.latitude, _userLocation.longitude),
                    LatLng(23.8859, 45.0792),
                zoom: 4,
                bearing: 0.0,
                tilt: 0.0,
              ),
              rotateGesturesEnabled: true,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              compassEnabled: true,
              tiltGesturesEnabled: true,
              scrollGesturesEnabled: true,
              zoomControlsEnabled: false,
              circles: homeProvider.circles,

              // markers: {
              //   Marker(icon: BitmapDescriptor.defaultMarker, markerId: MarkerId('a'),position: LatLng(30,40)),
              // },
              markers: homeProvider.isLoadingMarkers
                  ? {
                      Marker(
                        // icon: BitmapDescriptor.defaultMarker,
                        markerId: MarkerId('a'),
                        position: LatLng(70, -70),
                      )
                    }
                  : homeProvider.markers.toSet(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38, left: 12, right: 12),
              child: GestureDetector(
                onTap: () => homeProvider.mapAnimateToUserLocation(),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Styles.whiteColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: [
                      BoxShadow(
                        color: Styles.blackColor.withOpacity(0.15),
                        blurRadius: 1,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: const Icon(
                    Icons.location_on,
                    size: 30,
                  ),
                ),
              ),
            ),

            // Align(
            //   alignment: Alignment.topRight,
            //   child: Container(
            //     height: 500,
            //     width: 200,
            //     color: Colors.white,
            //     child: ListView.builder(
            //         scrollDirection: Axis.vertical,
            //         itemCount: homeProvider.users.length,
            //         shrinkWrap: true,
            //         physics: ClampingScrollPhysics(),
            //         itemBuilder: (context, index) {
            //           return Card(
            //             elevation: 3,
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Column(
            //                 children: [
            //                   Text("${homeProvider.users[index].username}"),
            //                   Container(
            //                     height: 8,
            //                   ),
            //                   Text("${homeProvider.users[index].phone}")
            //                 ],
            //               ),
            //             ),
            //           );
            //         }),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
