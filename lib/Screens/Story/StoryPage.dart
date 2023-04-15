import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import './StoryPageController.dart';
import "package:verico/Constants/Constants.dart" as Constants;

class StoryPage extends StatelessWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(StoryPageController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Stack(children: [
          Positioned(
              child: FutureBuilder(
            future: controller.fetchStories(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              controller.videoController!.play();
              return GestureDetector(
                onTap: () {
                  controller.tooglePlay();
                },
                onHorizontalDragDown: (details) {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: VideoPlayer(controller.videoController ??
                      VideoPlayerController.network(
                          "${Constants.Url}/stories/story/video/642879bbfe7c9546a7278fc3")),
                ),
              );
            },
          )),
          Positioned(
              left: 30,
              bottom: 20,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(300)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "data",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      Text(
                        "Posted by",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                ],
              )),
          Positioned(
              top: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
                onPressed: () {
                  Get.back();
                },
              ))
        ]),
      ),
    );
  }
}
