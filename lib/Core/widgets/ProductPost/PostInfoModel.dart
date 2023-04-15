import 'dart:core';
import 'package:verico/Core/widgets/ProductPost/PostInfoModel.dart';

// var sample = {
//   "post": {
//     "_id": "6430165fb8a9707471ef58c7",
//     "product": "640f667aa11a4c4384650b40",
//     "posts": [{}, {}],
//     "caption": "CAPTIPON 13",
//     "comments": [],
//     "creator": "6418a4136af02f4f41e06c7f",
//     "location": "INDIA",
//     "Tags": []
//   }
// };

class PostInfoModel {
  String? id;
  String? productId;
  int? len;
  int? likes;
  String? caption;
  String? creatorId;
  String? location;

  PostInfoModel(
      {this.id,
      this.caption,
      this.likes,
      this.len,
      this.creatorId,
      this.productId,
      this.location});
  PostInfoModel.fromJson(Map<String, dynamic> json) {
    var post = json['post'];
    id = post["_id"];
    productId = post["product"];
    len = post["posts"].length;
    caption = post["caption"];
    creatorId = post["creator"];
    location = post["location"];
    likes = post["likes"];
  }
}
