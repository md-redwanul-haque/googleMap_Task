import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mymap/app/modules/home/providers/_provider.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  ProviderClass Provider = ProviderClass();
  var altitudeLocation =''.obs;
  var latitudeLocation =0.0.obs;
  var longitudeLocation =0.0.obs;
   var latlon =LatLng(0.0,0.0);
  void getGeoLocation() {

    Provider.determinePosition().then((response) {
      print("Redwannnnnnn++++++++++++ + $response");
      latitudeLocation.value = response.latitude;
      longitudeLocation.value = response.longitude;
      altitudeLocation.value =response.altitude.toString();
      latlon =LatLng(response.latitude,response.longitude);
      print("latitudeLocation.value${latitudeLocation.value}");
      print(longitudeLocation.value);
      print(altitudeLocation.value);



    });

  }



  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
