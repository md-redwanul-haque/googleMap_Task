import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'package:get/get.dart';
import 'package:map_pin_picker/map_pin_picker.dart';

import '../controllers/home_controller.dart';
import 'dart:io';

class HomeView extends GetView<HomeController> {
  final _controller = Completer<GoogleMapController>();
  MapPickerController mapPickerController = MapPickerController();

  CameraPosition cameraPosition =  CameraPosition(

    bearing: 192.8334901395799,

    tilt: 59.440717697143555,

    target: LatLng(23.311158, 92.279737),
    zoom: 14.4746,
  );

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          Container(
            height: 500,
            width: 300,
            child: MapPicker(
              // pass icon widget
              iconWidget: Icon(Icons.location_pin, size: 50),
              //add map picker controller
              mapPickerController: mapPickerController,
              child: GoogleMap(
                myLocationEnabled: true,
                zoomControlsEnabled: true,
                // hide location button
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                //  camera position
                initialCameraPosition: cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onCameraMoveStarted: () {
                  // notify map is moving
                  mapPickerController.mapMoving!();
                  textController.text = "checking ...";
                },
                onCameraMove: (cameraPosition) {
                  this.cameraPosition = cameraPosition;
                },
                onCameraIdle: () async {
                  // notify map stopped moving
                  mapPickerController.mapFinishedMoving!();
                  //get address name from camera position
                  List<Placemark> placemarks = await placemarkFromCoordinates(
                    cameraPosition.target.latitude,
                    cameraPosition.target.longitude,
                  );

                  // update the ui with the address
                  textController.text =
                  '${placemarks.first.name}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}';
                },
              ),
            ),
          ),
          Container(

            width:  double.infinity,
            height: 30,
            child: TextFormField(
              maxLines: 3,
              textAlign: TextAlign.center,
              readOnly: true,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero, border: InputBorder.none),
              controller: textController,
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width:  double.infinity,
            height: 40,
            child: TextButton(
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFFFFFFFF),
                  fontSize: 19,
                  // height: 19/19,
                ),
              ),
              onPressed: () {
                print(
                    "Location ${cameraPosition.target.latitude} ${cameraPosition.target.longitude}");
                print("Address: ${textController.text}");
              },
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFFA3080C)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),

    );
  }




  Future<Position> determinePosition() async{
    bool serviceEnebled;
    LocationPermission permission;

    serviceEnebled  = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnebled){
      return Future.error("Location Service are disabled");
    }
    permission =await Geolocator.checkPermission();
    if(permission==LocationPermission.denied){
      permission =await Geolocator.requestPermission();

      if(permission==LocationPermission.denied){
        return Future.error("Location Permission denied");
      }
    }
    if(permission==LocationPermission.deniedForever){
      return Future.error("LOcation Permission Permanently denied");
    }

    Position position = await Geolocator.getCurrentPosition();
    controller.latitudeLocation.value=position.latitude;
    controller.longitudeLocation.value =position.longitude;
    return position;
  }
}
