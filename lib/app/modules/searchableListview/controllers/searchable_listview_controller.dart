import 'package:get/get.dart';

class SearchableListviewController extends GetxController {
  //TODO: Implement SearchableListviewController

  RxList<Map<String,dynamic>> allItems =[
    {"Name":"apple","Country":"A"},
    {"Name":"orange","Country":"A1"},
    {"Name":"lemon","Country":"A2"},
    {"Name":"banana","Country":"A3"},
    {"Name":"berry","Country":"A4"}
  ].obs;
  Rx<List<Map<String, dynamic>>> findItems =Rx<List<Map<String,dynamic>>> ([]);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    findItems.value =allItems.value;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;



  void filterItem(String item){
    Rx<List<Map<String, dynamic>>> result =Rx<List<Map<String,dynamic>>> ([]);

    if(item.isEmpty){
      result.value =allItems.value;
    }else{
      result.value =allItems.where((ele) => ele["Name"].toString().toLowerCase().contains(item.toLowerCase())).toList();
    }
    findItems.value =result.value;
  }
}
