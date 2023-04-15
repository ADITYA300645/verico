import 'package:get/get.dart';

class Stories {
  List<Story?>? stories;
  Stories({required stories});

  Stories.fromJson(List<dynamic> json) {
    if (stories == null) {
      stories = [];
      json.forEach((e) => {stories?.add(Story.fromJson(e))});
    }
  }
}

class Story {
  String? id;
  String? title;
  List<int>? imageData;

  Story({required this.id, required title, required imageData});
  Story.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    title = json["title"];
    imageData = json["thumbnail"]["data"].cast<int>();
  }
}
