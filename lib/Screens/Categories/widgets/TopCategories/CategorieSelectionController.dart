import 'dart:async';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Categories/widgets/TopCategories/CategoriesTittleModel.dart';
import '../../../../Constants/Constants.dart' as Constants;

class CategoryController extends GetxController {
  var currentCategoryIndex = 0.obs;
  var itemCount = 10.obs;
  var currentCategory = "all".obs;
  var Categories = [].obs;

  StreamController selectedCategory = StreamController.broadcast(
    onListen: () {
      print("object");
    },
    onCancel: () => print("cancled"),
  );

  void setCurrentCategorie(int idx) {
    currentCategoryIndex.value = idx;
    currentCategory.value = Categories.value[idx];
    selectedCategory.add(Categories[idx]);
    update();
  }

  Future<CategoriesTittles> getCategoriesTittle() async {
    Dio _dio = Dio();
    var response = await _dio.get("${Constants.Url}/categories/all");
    var categoriesData = CategoriesTittles.fromJson(response.data);
    Categories.value = categoriesData.tittles!;
    return categoriesData;
  }

  @override
  void onInit() {
    selectedCategory.add("");
    super.onInit();
  }
}
