import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Home/HomeUtils/TrendingProducts/TrendingProductController.dart';
import 'package:verico/Constants/Constants.dart' as Constants;

class TrendingProducts extends StatelessWidget {
  const TrendingProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TrendingProductController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 14.0, top: 10),
          child: Text("Trending-Products",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(81, 86, 203, 1),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder(
          future: controller.getProducts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text("loading...");
            }
            return Obx(
              () => ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: (controller.isExpanded.value)
                    ? snapshot.data!.products!.length
                    : 1,
                itemBuilder: (context, index) {
                  if (!snapshot.hasData) {
                    return const Center(child: Text("LOADDING...."));
                  }
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Stack(children: [
                          Container(
                            height: 130,
                            child: Row(
                              children: [
                                Container(
                                  width: 150,
                                  color: Colors.grey,
                                  child: Image.network(
                                    //http://localhost:3000/products/banners/banner/64340eaf230f720447d2f93c
                                    "${Constants.Url}/products/banners/banner/${snapshot.data!.products![index].id}",
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                              "${snapshot.data!.products![index].name}",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.indigo,
                                              )),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 4.0),
                                            child: Text(
                                                "Descripltion about product"),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Price : "),
                                          Text(snapshot
                                              .data!.products![index].price
                                              .toString()),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border,
                                    color: Colors.indigo),
                              ))
                        ]),
                      ));
                },
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {
              controller.toogleExpand();
            },
            child: Card(
              child: Container(
                height: 27.5,
                child: Center(
                  child: Obx(() => (controller.isExpanded.value)
                      ? const Text("close")
                      : const Text("Expand")),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
