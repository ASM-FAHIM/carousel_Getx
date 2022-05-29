import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_carousel/app/modules.home/controllers/home_controller.dart';
import 'package:getx_carousel/app/modules.home/views/failure_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home View"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isDataProcessing.value) {
          return Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (controller.isDataError.value) {
            return FailureView(onPressed: () {
              controller.getPopular();
            });
          } else {
            return CarouselSlider(items: items, options: options),
          }
        }
      }),
    );
  }
}
