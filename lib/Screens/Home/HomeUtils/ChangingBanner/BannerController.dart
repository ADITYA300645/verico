import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Home/HomeUtils/ChangingBanner/BannerModel.dart';
import '../../../../Constants/Constants.dart' as Constants;

class BannerController extends GetxController {
  var currentIndex = 0.obs;
  var len = 0.obs;
  void setLength(int length) {
    len.value = length;
  }

  void setIndex(int index) {
    print(index);
    if (index > len.value) {
      currentIndex.value = len.value;
      update();
      return;
    }
    if (index < 0) {
      currentIndex.value = 0;
      update();
      return;
    }
    currentIndex.value = index;
    update();
  }

  Future<Banner> getBanners() async {
    Dio _dio = Dio();
    var response = await _dio.get("${Constants.Url}/products/all");
    var banners = Banner.fromJson(response.data);
    // print(response.data);
    // print(banners.ProductIds);
    return banners;
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
