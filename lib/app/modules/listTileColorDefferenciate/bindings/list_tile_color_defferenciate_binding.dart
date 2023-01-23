import 'package:get/get.dart';

import '../controllers/list_tile_color_defferenciate_controller.dart';

class ListTileColorDefferenciateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListTileColorDefferenciateController>(
      () => ListTileColorDefferenciateController(),
    );
  }
}
