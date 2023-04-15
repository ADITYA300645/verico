import 'dart:math';
import 'dart:typed_data';
import 'package:verico/Screens/Explore/ExploreController.dart';

import './widgets/explorePost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Search/SerchView.dart';
import 'package:verico/Utils/CustomDrawer/CustomDrawer.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int randomC() {
      var random = Random();
      var val = random.nextInt(255);
      return val;
    }

    double randomv() {
      var random = Random();
      var val = random.nextDouble();
      return val;
    }

    final GlobalKey<ScaffoldState> _sacffoldKey =
        new GlobalKey<ScaffoldState>();

    var controller = Get.put(ExploreController());
    return Scaffold(
      key: _sacffoldKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(transition: Transition.rightToLeft, SearchView());
                },
                icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag))
          ],
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.indigo,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                _sacffoldKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu_open_sharp))),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: controller.fetchIds(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text("loading......"));
                  }
                  print(snapshot.data!.postId);
                  return GridView.custom(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 6,
                          pattern: const [
                            QuiltedGridTile(4, 4),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(6, 6),
                            QuiltedGridTile(3, 3),
                            QuiltedGridTile(3, 3),
                          ],
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                          repeatPattern: QuiltedGridRepeatPattern.inverted),
                      childrenDelegate: SliverChildBuilderDelegate(
                        childCount: snapshot.data!.postId!.length,
                        (context, index) {
                          return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              color: Color.fromRGBO(
                                  randomC(), randomC(), randomC(), randomv()),
                              child: ExplorePost(
                                  id: snapshot.data!.postId![index]));
                        },
                      ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
