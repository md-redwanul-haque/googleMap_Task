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
      body: Column(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return
                Obx(()=>ListTile(
                  title: Text('Item: $index',
                      style: TextStyle(
                          color: selectedIndex.value == index
                              ? Colors.blue
                              : Colors.black)),
                  // tileColor: selectedIndex == index ? Colors.blue : null,
                  onTap: () {
                    selectedIndex.value = index;
                    print(selectedIndex.value);

                  },
                ));
            },
          )
        ],
      )
    );
  }
}
