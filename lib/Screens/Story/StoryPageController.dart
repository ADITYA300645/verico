import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../Constants/Constants.dart' as Constatnts;
import 'package:path_provider/path_provider.dart';
import './StoryModel.dart';

class StoryPageController extends GetxController {
  var Id = Get.arguments[0];
  RxList stories = [].obs;
  File? file;
  VideoPlayerController? videoController;
  var isPlaying = true.obs;
  tooglePlay() {
    isPlaying.value = !(isPlaying.value);
    if (isPlaying.value == true) {
      videoController!.play();
    } else {
      videoController!.pause();
    }
    update();
  }

  Future<Story?> fetchStories() async {
    Dio _dio = Dio();
    var response = await _dio.get("${Constatnts.Url}/stories/story/info/$Id");
    videoController = VideoPlayerController.network(
        "${Constatnts.Url}/stories/story/video/$Id");
    await videoController!.initialize();
    videoController!.setLooping(true);
    var story = Story.fromJson(response.data);
    return story;
  }

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    // videoController!.play();
    super.onReady();
  }

  @override
  void onClose() {
    videoController!.pause();
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    // videoController!.dispose();
    return super.onDelete;
  }
}
