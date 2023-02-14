import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {

  late GoogleMapController controller;
  BitmapDescriptor? _markerIcon;

  LatLng _kMapCenter = LatLng(40.423385, -3.528790);

  static const CameraPosition _kGooglePlex = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(40.423385, -3.528790),
    tilt: 79.440717697143555,
    zoom: 18.4746,
  );

  static const CameraPosition _kGooglePlex2 = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(40.423385, -3.528790),
    tilt: 79.440717697143555,
    zoom: 34.4746,
  );

  static const CameraPosition _kSol = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(40.416924, -3.703517),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          this.controller=controller;
        },
        markers: <Marker>{_createMarker()},
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheSol,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheSol() async {
    controller.animateCamera(CameraUpdate.newCameraPosition(_kSol));
  }

  Marker _createMarker() {
    if (_markerIcon != null) {
      return Marker(
        markerId: const MarkerId('marker_1'),
        position: _kMapCenter,
        icon: _markerIcon!,
      );
    } else {
      return Marker(
        markerId: MarkerId('marker_1'),
        position: _kMapCenter,
      );
    }
  }

}