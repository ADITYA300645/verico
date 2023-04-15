import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:verico/Screens/Categories/widgets/TopCategories/CategorieSelectionController.dart';
import '';

class TopCategories extends StatefulWidget {
  const TopCategories({Key? key}) : super(key: key);

  @override
  State<TopCategories> createState() => _TopCategoriesState();
}

class _TopCategoriesState extends State<TopCategories> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CategoryController());
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Container(
        height: 40,
        child: FutureBuilder(
          future: controller.getCategoriesTittle(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text("loading..."));
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemCount: snapshot.data!.tittles!.length,
              itemBuilder: (context, index) {
                return (index == controller.currentCategoryIndex.value)
                    ? GestureDetector(
                        onTap: () {
                          controller.setCurrentCategorie(index);
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data!.tittles![
                                controller.currentCategoryIndex.value],
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: Colors.indigo,
                                // decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.solid),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.setCurrentCategorie(index);
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data!.tittles![index],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.grey,
                                decorationStyle: TextDecorationStyle.solid),
                          ),
                        ),
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
