import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:location/location.dart';
import 'package:get/get.dart';


import '../controllers/test_gps_controller.dart';

class TestGpsView extends GetView<TestGpsController> {
  const TestGpsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestGpsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  Location location = new Location();
                  bool ison = await location.serviceEnabled();
                  if (!ison) { //if defvice is off
                    bool isturnedon = await location.requestService();
                    if (isturnedon) {
                      print("GPS device is turned ON");
                    }else{
                      print("GPS Device is still OFF");
                    }
                  }

                },
                child: Text("Turn On GPS | Location Package")
            ),

            ElevatedButton(
                onPressed: () async {
                  AppSettings.openLocationSettings();
                },
                child: Text("Turn On GPS | App Setting Package")
            )
          ],
        )
      ),
    );
  }
}
