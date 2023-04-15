import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:verico/Constants/Constants.dart' as Constants;
import 'package:verico/Screens/Explore/ExploreModel.dart';

class ExploreController extends GetxController {
  Future<ExploreModel> fetchIds() async {
    Dio _dio = Dio();
    var response = await _dio.get("${Constants.Url}/explore");
    var exploreIds = ExploreModel.fromJson(response.data);
    print(exploreIds.postId);
    return exploreIds;
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
