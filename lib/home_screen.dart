import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller =Completer();
  static const _kgooglePlex = LatLng(37.42, -127.08);

  List<Marker> _markers = [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(31.42, 78.08),
      infoWindow: InfoWindow(
        title: 'My Current Location',
      ),
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(33.42, 73.08), // Sample coordinates for e-11 sector
      infoWindow: InfoWindow(
        title: 'e-11 sector',
      ),
    ),
    Marker(
      markerId: MarkerId("3"),
      position: LatLng(45.43, 93.07), // Sample coordinates for e-2 sector
      infoWindow: InfoWindow(
        title: 'e-2 sector',
      ),
    ),
    Marker(
      markerId: MarkerId("3"),
      position: LatLng(35.6762, 139.65), // Sample coordinates for e-2 sector
      infoWindow: InfoWindow(
        title: 'Tokyo, Japan',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          markers: Set.from(_markers),
        onMapCreated:(GoogleMapController controller){
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          target: _kgooglePlex,
          zoom: 3,
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed:()async {
          GoogleMapController controller=await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
             CameraPosition(
                 target: LatLng(35.6762, 139.65),
               zoom: 14,
          )
          )
          );
          setState(() {

          });
        },
      ),
    );

  }
}


