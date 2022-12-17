import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'dart:io';

class HomeView extends GetView<HomeController> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();


 RxBool mapButton =false.obs;


  @override
  Widget build(BuildContext context) {
    CameraPosition _kGooglePlex = CameraPosition(
      target: controller.latlon,
      zoom: 14.4746,
    );
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
            ):Container(),)

          ],
        ),
      )

    );
  }
}
