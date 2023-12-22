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
  Completer<GoogleMapController> _completer = Completer();
  static final CameraPosition _keyposition = CameraPosition(
      target: LatLng(23.79089809200417, 90.40954134637299),
      zoom: 14.4746
  );
  List<Marker>_marker = [];
  List<Marker>_list = [
    Marker(markerId: MarkerId('1'),
        position: LatLng(23.79089809200417, 90.40954134637299),
        infoWindow: InfoWindow(
            title: "My location"
        )
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Map'),),
      body: GoogleMap(
        initialCameraPosition: _keyposition,
        mapType: MapType.normal,
        markers: Set<Marker>.of(_marker),
        myLocationEnabled: true,
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _completer.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GoogleMapController controller = await _completer.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(23.79089809200417, 90.40954134637299))
          ));
          setState(() {

          });
        },
        child: Icon(Icons.location_disabled),
      ),
    );
  }
}
