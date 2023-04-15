import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:verico/Core/widgets/ProductPost/ProductPostController.dart';
import 'package:verico/Constants/Constants.dart' as Constants;

class ProductPost extends StatelessWidget {
  String postId;
  ProductPost({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postController = Get.put(ProductPostController());
    return Card(
      elevation: 1111,
      margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 7.5),
      child: FutureBuilder(
        future: postController.fetchPost(postId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 4, top: 4),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10000))),
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("${snapshot.data!.creatorId}",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700)),
                              const Text("EXTRA INFO"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        icon: const Icon(Icons.more_horiz, size: 30),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Card(
                    child: Container(
                      height: 400,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: ClipRRect(
                        // exple : http://localhost:3000/posts/post/64301677b8a9707471ef58cb/assets/0

                        borderRadius: BorderRadius.circular(5),
                        child: PageView.builder(
                            pageSnapping: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.len,
                            itemBuilder: (context, index) => Image.network(
                                fit: BoxFit.cover,
                                "${Constants.Url}/posts/post/${postId}/assets/$index")),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.align_horizontal_left,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.send,
                                  size: 30,
                                ))
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.bookmark_border,
                              size: 30,
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("LIKED BY ${snapshot.data!.likes} and others",
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text("last commentere  : ",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          Flexible(
                            child: Text(
                              "Last comment ",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ]);
        },
      ),
    );
  }
}
