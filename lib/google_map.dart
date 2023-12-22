import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Googlehome extends StatefulWidget {
  const Googlehome({super.key});
  @override
  State<Googlehome> createState() => _GooglehomeState();
}
class _GooglehomeState extends State<Googlehome> {
  Completer<GoogleMapController> _completer=Completer();
  static final CameraPosition  _keyposition = CameraPosition(
      target: LatLng(23.79089809200417, 90.40954134637299),
zoom: 14.4746
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Map'),),
      body: GoogleMap(
        initialCameraPosition: _keyposition,
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller){
          _completer.complete(controller);
        },
      ),
    );
  }
}
