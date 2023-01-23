import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_tile_color_defferenciate_controller.dart';

class ListTileColorDefferenciateView
    extends GetView<ListTileColorDefferenciateController> {
  const ListTileColorDefferenciateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTileColorDefferenciateView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ListTileColorDefferenciateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
