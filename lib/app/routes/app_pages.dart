import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/listTileColorDefferenciate/bindings/list_tile_color_defferenciate_binding.dart';
import '../modules/listTileColorDefferenciate/views/list_tile_color_defferenciate_view.dart';
import '../modules/searchableListview/bindings/searchable_listview_binding.dart';
import '../modules/searchableListview/views/searchable_listview_view.dart';
import '../modules/testGps/bindings/test_gps_binding.dart';
import '../modules/testGps/views/test_gps_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SEARCHABLE_LISTVIEW;

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
    GetPage(
      name: _Paths.SEARCHABLE_LISTVIEW,
      page: () => const SearchableListviewView(),
      binding: SearchableListviewBinding(),
    ),
    GetPage(
      name: _Paths.LIST_TILE_COLOR_DEFFERENCIATE,
      page: () => const ListTileColorDefferenciateView(),
      binding: ListTileColorDefferenciateBinding(),
    ),
  ];
}
