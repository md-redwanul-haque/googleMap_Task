import 'package:get/get.dart';

import '../controllers/test_gps_controller.dart';

class TestGpsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestGpsController>(
      () => TestGpsController(),
    );
  }
}
