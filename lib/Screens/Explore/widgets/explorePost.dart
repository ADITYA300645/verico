import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:verico/Core/widgets/ProductPost/ProductPostController.dart';
import 'package:verico/Constants/Constants.dart' as Constants;

class ExplorePost extends StatelessWidget {
  String? id;
  ExplorePost({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postController = Get.put(ProductPostController());
    return FutureBuilder(
        future: postController.fetchPost(id!),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text("loading..."));
          }
          return GestureDetector(
            onLongPressStart: (e) {
              print("long press...  on ");
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                  fit: BoxFit.cover,
                  "${Constants.Url}/posts/post/${id}/assets/0"),
            ),
          );
        });
  }
}
