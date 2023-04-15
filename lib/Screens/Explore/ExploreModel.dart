class ExploreModel {
  List<String>? postId = [];
  ExploreModel({this.postId});
  ExploreModel.fromJson(Map<String, dynamic> json) {
    json["posts"]?.forEach((element) {
      postId?.add(element["_id"]);
    });
  }
}
