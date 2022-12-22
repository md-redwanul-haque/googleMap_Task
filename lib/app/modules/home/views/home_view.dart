import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'dart:io';

class HomeView extends GetView<HomeController> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();


  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.810331, 90.412521),
    zoom: 14.4746,
  );
  Set<Marker> marker = {};

 RxBool mapButton =false.obs;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                controller.getGeoLocation();
              },
              child: Text("myLOcation"),
            ),

                ElevatedButton(onPressed: (){
              if(mapButton.value==false){
                mapButton.value =true;
              }else{
                mapButton.value=false;
              }
            }, child: Text("Map"),),
            Obx(()=>mapButton.value==true?Container(
              height: 300,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);

                },
              ),
            ):Container(),),

            Obx(()=>controller.latitudeLocation.value!=null?ElevatedButton(onPressed: ()async{
              Position position = await determinePosition();
              final GoogleMapController gcontroller = await _controller.future;
              await gcontroller.animateCamera(
                  CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(controller.latitudeLocation.value,controller.longitudeLocation.value),zoom: 14)));

              marker.clear();
              marker.add(Marker(markerId: MarkerId("Current location"),
                  position: LatLng(position.latitude,position.longitude)
              ));

              print(controller.latitudeLocation.value);
              print(controller.longitudeLocation.value);

            }, child: Text("My Location")):Container())

          ],
        ),
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
