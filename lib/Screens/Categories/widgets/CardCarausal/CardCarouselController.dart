import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Categories/widgets/CardCarausal/CarouselCardModel.dart';
import 'package:verico/Screens/Categories/widgets/TopCategories/CategorieSelectionController.dart';
import '../../../../Constants/Constants.dart' as Constants;

class CarouselCardController extends GetxController {
  var currentCategoryController = Get.put(CategoryController());

  RxInt cardIndex = 0.obs;

  StreamController<CarouselCardModel> modelMaker = StreamController.broadcast();

  Future fetchData(String field) async {
    print(field);
    Dio _dio = Dio();
    var response = await _dio
        .get("${Constants.Url}/categories/category?category=${field}");
    print(response.data);
    var model = CarouselCardModel.fromJson(response.data);
    try {
      if (response.data == {"products": []}) {
        throw Error();
      } else {
        modelMaker.add(model);
      }
    } catch (e) {
      print("ERROR MAN MADE");
    }
  }

  void setIndex(int index) {
    cardIndex.value = index;
  }

  @override
  void onInit() {
    currentCategoryController.selectedCategory.stream.listen((event) {
      print(event);

      fetchData(event);
    });
    super.onInit();
  }
}
