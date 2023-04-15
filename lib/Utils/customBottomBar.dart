import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verico/Core/conrollers/AuthJwtController.dart';
import 'package:verico/Screens/Categories/widgets/TopCategories/CategorieSelectionController.dart';
import '../Utils/BottomBarController.dart';

class CustomBottomBar extends StatelessWidget {
  var controller = Get.put(tag: "one", BottomBarController());
  var categorieController = Get.put(CategoryController());
  CustomBottomBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            Row(children: [
              IconButton(
                  onPressed: () {
                    controller.jumpTo(0);
                  },
                  icon: Obx(
                    () => (controller.currentPageIndex.value == 0)
                        ? const Icon(Icons.home)
                        : const Icon(Icons.home_outlined),
                  )),
              IconButton(
                onPressed: () {
                  controller.jumpTo(1);
                  categorieController.selectedCategory.add("All");
                },
                icon: Obx(
                  () => (controller.currentPageIndex.value == 1)
                      ? const Icon(Icons.category)
                      : const Icon(Icons.category_outlined),
                ),
              ),
              IconButton(
                  onPressed: () {
                    controller.jumpTo(2);
                  },
                  icon: Obx(
                    () => (controller.currentPageIndex.value == 2)
                        ? const Icon(Icons.shopping_cart)
                        : const Icon(Icons.shopping_cart_outlined),
                  )),
              IconButton(
                  onPressed: () {
                    controller.jumpTo(3);
                  },
                  icon: Obx(
                    () => (controller.currentPageIndex.value == 3)
                        ? const Icon(
                            Icons.account_circle,
                          )
                        : const Icon(Icons.account_circle_outlined),
                  )),
            ]),
            Row(
              children: [
                Obx(
                  () => (controller.currentPageIndex.value == 4)
                      ? ElevatedButton(
                          onPressed: () {
                            controller.jumpTo(4);
                          },
                          style: const ButtonStyle(
                              animationDuration: Duration(milliseconds: 500),
                              shape: MaterialStatePropertyAll(
                                  BeveledRectangleBorder(
                                      side: BorderSide(
                                          width: 0.7,
                                          style: BorderStyle.solid,
                                          color: Colors.black54))),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black)),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(Icons.explore),
                                SizedBox(width: 10),
                                Text("Explore")
                              ]),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            controller.jumpTo(4);
                          },
                          style: const ButtonStyle(
                              animationDuration: Duration(milliseconds: 500),
                              shape: MaterialStatePropertyAll(
                                  BeveledRectangleBorder(
                                      side: BorderSide(
                                          width: 0.7,
                                          style: BorderStyle.solid,
                                          color: Colors.black54))),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white)),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(Icons.explore_outlined),
                                SizedBox(width: 10),
                                Text("Explore")
                              ]),
                        ),
                )
              ],
            )
          ],
        ));
  }
}
