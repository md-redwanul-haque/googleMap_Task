import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/single_select_list_view_controller.dart';

class SingleSelectListViewView extends GetView<SingleSelectListViewController> {
  const SingleSelectListViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleSelectListViewView'),
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
                          color: controller.selectedIndex.value == index
                              ? Colors.blue
                              : Colors.black)),
                  // tileColor: selectedIndex == index ? Colors.blue : null,
                  onTap: () {
                    controller.selectedIndex.value = index;
                    print(controller.selectedIndex.value);

                  },
                ));
            },
          )
        ],
      )
    );
  }
}
