import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Home/HomeUtils/TrendingProducts/TrendingProductModel.dart';
import "../../../../Constants/Constants.dart" as Constants;

class TrendingProductController extends GetxController {
  var isExpanded = false.obs;
  void toogleExpand() {
    isExpanded.value = !isExpanded.value;
  }

  Future<TrendingProductModel> getProducts() async {
    Dio _dio = Dio();
    var response =
        await _dio.get("${Constants.Url}/products/top-products/trending");
    return TrendingProductModel.fromJson(response.data);
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
