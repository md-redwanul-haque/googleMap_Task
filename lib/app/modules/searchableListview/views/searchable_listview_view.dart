import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/searchable_listview_controller.dart';

class SearchableListviewView extends GetView<SearchableListviewController> {
  const SearchableListviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RxInt selectedIndex=0.obs;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchableListviewView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              TextFormField(
                onChanged: (value)=>controller.filterItem(value),
                decoration: InputDecoration(
                  labelText: "search"
                ),
              ),
            SizedBox(height: 10,),
            Obx(()=>ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.findItems.value.length,
                itemBuilder: (BuildContext context , int index)

            {
              return ListTile(
                title: Text("${controller.findItems.value[index]["Name"]}"),
                subtitle: Text("${controller.findItems.value[index]["Country"]}"),
              );
            }))
          ],
        ),
      )
    );
  }
}
