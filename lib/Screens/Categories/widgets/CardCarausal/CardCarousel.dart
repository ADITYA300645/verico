import 'dart:typed_data';
import 'package:verico/Constants/Constants.dart' as Constants;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:verico/Screens/Categories/widgets/TopCategories/CategorieSelectionController.dart';
import './CardCarouselController.dart';

class CardCarousel extends StatelessWidget {
  const CardCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CarouselCardController());
    var currentCategoryController =
        Get.put(CategoryController(), permanent: true);
    currentCategoryController.selectedCategory.stream.listen((event) {});
    return SizedBox(
      height: 350,
      child: StreamBuilder(
        stream: controller.modelMaker.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Transform.scale(
              scale: 1,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text("OPPS GOT AN ERROR..."),
                ),
              ),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                height: 300,
                width: 225,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text("NO Data Found"),
                  ),
                ),
              ),
            );
          }
          if (snapshot.data!.cards!.length == 0) {
            return Center(
              child: SizedBox(
                height: 300,
                width: 225,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Some how i cant find any data in it..."),
                    ),
                  ),
                ),
              ),
            );
          }
          if (snapshot.data == -1) {
            print("Loading Shoulkd Work");
          }

          return PageView.builder(
            itemCount: snapshot.data!.cards!.length,
            controller: PageController(viewportFraction: 0.7),
            pageSnapping: true,
            onPageChanged: controller.setIndex,
            itemBuilder: (context, index) {
              return Obx(
                //todo : implement Animation
                () => Transform.scale(
                  scale: controller.cardIndex.value == index ? 1 : 0.9,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.network(
                        fit: BoxFit.cover,
                        "${Constants.Url}/products/banners/banner/${snapshot.data!.cards![index].id}"),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
