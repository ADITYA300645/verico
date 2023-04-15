import './StoryModel.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../Constants/Constants.dart' as Constatnts;

class StoriesViewController extends GetxController {
  Future<Stories?> fetchStories() async {
    Dio _dio = Dio();
    var response = await _dio.get("${Constatnts.Url}/stories/thumbnails-all");
    // print("$response");
    var values = Stories.fromJson(response.data);

    values.stories?.forEach((element) {});

    return values;
  }
}
