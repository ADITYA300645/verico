import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Categories/widgets/CardCarausal/CardCarouselController.dart';
import 'package:verico/Screens/Home/HomeUtils/TopRated/TopRatedController.dart';
import 'package:verico/Constants/Constants.dart' as Constants;

class TopRated extends StatelessWidget {
  const TopRated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CarouselCardController());
    var topRatedController = Get.put(TopRatedController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text("Top Rated",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(81, 86, 203, 1),
                  )),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("more"),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder(
          future: topRatedController.fetchTopRated(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("loading..."),
              );
            }
            return Container(
              height: 470,
              child: PageView.builder(
                itemCount: snapshot.data!.products!.length,
                controller: PageController(viewportFraction: 0.79),
                pageSnapping: true,
                onPageChanged: controller.setIndex,
                itemBuilder: (context, index) {
                  return Obx(
                    //todo : implement Animation
                    () => Transform.scale(
                      scale: controller.cardIndex.value == index ? 1 : 0.9,
                      child: Card(
                        elevation: 6,
                        // http://localhost:3000/products/banners/banner/64340eaf230f720447d2f93c
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                              "${Constants.Url}/products/banners/banner/${snapshot.data!.products![index].id}",
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
