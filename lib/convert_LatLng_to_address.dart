
import 'package:geocoding/geocoding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConvertLatLngToAddress extends StatefulWidget {
   ConvertLatLngToAddress({Key ? key }): super (key:key);
  String stAddress='';
  @override
  State<ConvertLatLngToAddress> createState() => _ConvertLatLngToAddressState();
}

class _ConvertLatLngToAddressState extends State<ConvertLatLngToAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ()async{
    List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");

    //final coordinates= Coordinates(33.9901, 71.5356);
              setState(() {
                //stAddress=locations.last.longitude.toString()+''+locations.last.longitude.toString();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green
                ),
            
                child: Center(
                    child: Text('Convert'),
            
                  ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}


