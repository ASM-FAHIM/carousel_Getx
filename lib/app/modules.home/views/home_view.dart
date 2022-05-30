import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_carousel/app/modules.home/controllers/home_controller.dart';
import 'package:getx_carousel/app/modules.home/views/failure_view.dart';

class HomeView extends GetView<HomeController> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home View"),
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
            return CarouselSlider(
              items: generateSlider(),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
            );
          }
        }
      }),
    );
  }

  List<Widget> generateSlider() {
    List<Widget> imageSliders = controller.lstPopular.map((item) {
      return Container(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: CachedNetworkImage(
              imageUrl: item['image_thumbnail_path'],
              fit: BoxFit.cover,
              width: Get.width,
              placeholder: (context, url) => Container(
                color: Colors.grey,
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
            ),
          ),
        ),
      );
    }).toList();
    return imageSliders;
  }
}
