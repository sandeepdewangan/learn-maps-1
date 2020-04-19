import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkinglocation/service_geolocator.dart';
import 'package:provider/provider.dart';

import 'search.dart';

void main(){
  return runApp(
    MaterialApp(
      title: 'Parking App with Maps',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool mapToggle= false;
  var currentLocation;
  GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((curloc){
      setState(() {
        currentLocation = curloc;
        mapToggle = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 80.0,
              width: MediaQuery.of(context).size.width,
              child: mapToggle ? GoogleMap(
                onMapCreated: onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(currentLocation.latitude, currentLocation.longitude),
                  zoom: 16.0,
                ),
                zoomGesturesEnabled: true,
              ) : Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void onMapCreated(controller){
    setState(() {
      mapController = controller;
    });
  }
}

