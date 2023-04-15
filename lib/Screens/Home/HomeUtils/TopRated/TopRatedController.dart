import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Home/HomeUtils/TopRated/TopRatedProductModel.dart';
import '../../../../Constants/Constants.dart' as Constants;

class TopRatedController extends GetxController {
  Future<TopRatedModel> fetchTopRated() async {
    Dio _dio = Dio();
    var response = await _dio.get("${Constants.Url}/products/top-products");
    var model = await (TopRatedModel.fromJson(response.data));
    return model;
  }

  @override
  void onInit() {
    fetchTopRated();
    super.onInit();
  }
}
