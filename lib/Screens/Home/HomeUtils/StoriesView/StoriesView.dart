import 'dart:typed_data';
import '../../../Story/StoryPage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:verico/Screens/Home/HomeUtils/StoriesView/StoryModel.dart'
    hide Image;
import './StoriesViewController.dart';

class StoriesView extends StatelessWidget {
  const StoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(StoriesViewController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 12, left: 10.0),
          child: Text("Top-stories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(81, 86, 203, 1),
              )),
        ),
        SizedBox(
          height: 20,
        ),
        FutureBuilder(
          future: controller.fetchStories(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text("LOADING..."));
            }

            return SingleChildScrollView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                        height: 300,
                        child: ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.stories!.length,
                          itemBuilder: (context, index) {
                            // if (index == 0) {
                            //   return Padding(
                            //     padding: const EdgeInsets.only(left: 11.0),
                            //     child: Card(
                            //         child: Container(
                            //       width: 200,
                            //       child: Image.memory(
                            //           fit: BoxFit.cover,
                            //           Uint8List.fromList(snapshot
                            //                   .data!.stories![index]!.imageData ??
                            //               Uint8List(0))),
                            //     )),
                            //   );
                            // }

                            return GestureDetector(
                              onTap: () {
                                print(snapshot.data!.stories![index]!.id);
                                print("--------------");
                                Get.to(() => StoryPage(), arguments: [
                                  snapshot.data!.stories![index]!.id
                                ]);
                              },
                              child: Card(
                                color: Colors.indigo,
                                child: Container(
                                  width: 200,
                                  child: Image.memory(
                                      fit: BoxFit.cover,
                                      Uint8List.fromList(snapshot.data!
                                              .stories![index]!.imageData ??
                                          Uint8List(0))),
                                ),
                              ),
                            );
                          },
                        )),
                  ),
                  TextButton(onPressed: () {}, child: Text("more"))
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
