import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class usercurrentlocation extends StatefulWidget {
  const usercurrentlocation({super.key});

  @override
  State<usercurrentlocation> createState() => _usercurrentlocationState();
}
class _usercurrentlocationState extends State<usercurrentlocation> {
  final Completer <GoogleMapController> _controller =Completer();
  static const CameraPosition _kgooglePlex =CameraPosition(
      target : LatLng(31.42, 78.08),
       zoom: 14,
  );
  final List<Marker> _markers = [
  Marker(
  markerId: MarkerId('1'),
  position: LatLng(31.42, 78.08),
  infoWindow: InfoWindow(
  title: 'My Current Location',
  ),
  ),
  ];
  Future<Position>usercurrentlocation() async{
    await Geolocator.requestPermission().then((value){
      
    }).onError((error, stackTrace) {
      print('error'+error.toString());
    });
    return await Geolocator.getCurrentPosition();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kgooglePlex,
        markers: Set.from(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()async{
            usercurrentlocation().then((value)async{
              print('MyCurrentLocation');
              print (value.latitude.toString()+''+value.longitude.toString());
              _markers.add(
                Marker(
                    markerId:MarkerId('1'),
                  position: LatLng(value.latitude,value.longitude),
                  infoWindow: InfoWindow(
                    title: 'My Current Location'
                  )
                )
              );
              CameraPosition cameraPosition =CameraPosition(
                  target:LatLng(value.latitude,value.longitude));
              final GoogleMapController controller= await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
              setState(() {

              });
            });
          },
          child: Icon(Icons.local_activity),
        )


    );
  }
}
