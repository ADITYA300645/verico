import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Home/HomeUtils/ChangingBanner/BannerController.dart';
import 'package:verico/Screens/ProductPage/ProductPageView.dart';
import 'package:verico/Constants/Constants.dart' as Constants;

class ChangingBanner extends StatelessWidget {
  const ChangingBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BannerController());

    return FutureBuilder(
        future: controller.getBanners(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Card(
              color: Colors.grey,
              child: Container(
                height: 200,
                child: Center(
                  child: Text("Loadding"),
                ),
              ),
            );
          }
          return Stack(children: [
            Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: PageView.builder(
                  onPageChanged: (index) => controller.setIndex(index),
                  itemCount: snapshot.data!.ProductIds!.length,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Card(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(ProductPageView(
                          id: snapshot.data!.ProductIds![index],
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Image.network(
                          "${Constants.Url}/products/banners/banner/${snapshot.data!.ProductIds![index]}",
                          fit: BoxFit.cover,
                        ),
                        // http://localhost:3000/products/banners/banner/64340eaf230f720447d2f93c
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // todo : PUT DOTS IN ACTION
          ]);
        });
  }
}
