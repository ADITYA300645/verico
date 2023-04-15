import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:verico/Core/widgets/ProductPost/PostInfoModel.dart';
import '../../../Constants/Constants.dart' as Constants;

class ProductPostController extends GetxController {
  // exple : http://localhost:3000/posts/post/64301677b8a9707471ef58cb/assets/0

  Future<PostInfoModel> fetchPost(String id) async {
    Dio _dio = Dio();
    var response = await _dio.get("${Constants.Url}/posts/post/${id}/info");
    print("fetching product postmodel...");
    return PostInfoModel.fromJson(response.data);
  }
}
