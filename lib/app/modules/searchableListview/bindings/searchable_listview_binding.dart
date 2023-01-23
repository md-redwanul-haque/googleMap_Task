import 'package:get/get.dart';

import '../controllers/searchable_listview_controller.dart';

class SearchableListviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchableListviewController>(
      () => SearchableListviewController(),
    );
  }
}
