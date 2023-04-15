class Story {
  String? id;
  String? title;
  String? productId;
  String? creatorId;
  int? likes;
  Story(
      {required this.id,
      required this.title,
      required this.productId,
      required this.creatorId,
      required this.likes});

  Story.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    title = json["title"];
    productId = json["product"];
    creatorId = json["creator"];
    likes = json["likes"];
  }
}
