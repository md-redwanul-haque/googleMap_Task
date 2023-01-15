import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/testGps/bindings/test_gps_binding.dart';
import '../modules/testGps/views/test_gps_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TEST_GPS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TEST_GPS,
      page: () => const TestGpsView(),
      binding: TestGpsBinding(),
    ),
  ];
}
