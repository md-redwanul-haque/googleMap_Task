import 'package:get/get.dart';

import '../controllers/single_select_list_view_controller.dart';

class SingleSelectListViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleSelectListViewController>(
      () => SingleSelectListViewController(),
    );
  }
}
