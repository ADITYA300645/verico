import 'package:flutter/material.dart';
import '../../../../Core/widgets/ProductPost/ProductPost.dart';

class TrendingPosts extends StatelessWidget {
  TrendingPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 14.0, top: 10),
          child: Text("Top-Posts",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(81, 86, 203, 1),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        //todo : Make More POSTS
        // ProductPost
        // ),
        ProductPost(postId: "64301677b8a9707471ef58cb")
      ],
    );
  }
}
