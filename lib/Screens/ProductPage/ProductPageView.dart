import 'package:verico/Constants/Constants.dart' as Constants;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Home/HomeUtils/TrendingPosts/TrendingPost.dart';
import 'package:verico/Screens/Home/HomeUtils/TrendingProducts/TrendingProducts.dart';
import 'package:verico/Screens/Home/HomeView.dart';
import 'package:verico/Screens/ProductPage/Pages/AddressOptions/AddressOptions.dart';
import 'package:verico/Utils/CustomDrawer/CustomDrawer.dart';
import '../Search/SerchView.dart';

class ProductPageView extends StatelessWidget {
  String? id;
  ProductPageView({Key? key, required this.id}) : super(key: key);
  final GlobalKey<ScaffoldState> _sacffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _sacffoldKey,
        drawer: const CustomDrawer(),
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(
                        transition: Transition.rightToLeft, const SearchView());
                  },
                  icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag))
            ],
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.indigo,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Get.back(canPop: true);
                },
                icon: const Icon(
                  Icons.arrow_back,
                ))),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 350,
                child: Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            child: Image.network(
                                fit: BoxFit.cover,
                                //products/banners/banner/
                                "${Constants.Url}/products/banners/banner/${id}"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 25,
                    child: TextButton(
                        style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(11),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.indigo),
                        ),
                        onPressed: () {},
                        child: SizedBox(
                          width: 150,
                          height: 30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.add_shopping_cart),
                              Text("Add to cart"),
                            ],
                          ),
                        )),
                  ),
                  Positioned(
                      left: 50,
                      bottom: 33,
                      width: 100,
                      height: 13,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                width: 11,
                                decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              width: 11,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          );
                        },
                      )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Name Of Product",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w600)),
                    Text(
                      "255",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.blue),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8, right: 120),
                child: Text(
                  "long narrow descript"
                  "ion with a heavy lighn that dont go a lot away will make the "
                  "work smoothlong narrow description with a "
                  "heavy lighn that dont go a lot away will make the work smooth ...",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              TextButton(onPressed: () {}, child: const Text("more")),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 42.0, vertical: 0),
                child: Container(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.space_dashboard_rounded)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.signpost)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.movie_creation_outlined)),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 42.0, vertical: 0),
                child: Container(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => Card(
                    child: Container(
                      height: 30,
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //todo implement reviews and comments
                    Text("COMMENTS and Reviews..."),
                    Container(
                      height: 200,
                    )
                  ],
                ),
              ),
              const TrendingProducts(),
            ],
          ),
        ),
        bottomNavigationBar: Card(
          elevation: 0,
          child: Container(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_border)),
                TextButton(
                    style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor: MaterialStatePropertyAll(Colors.indigo),
                    ),
                    onPressed: () {
                      Get.to(AddressOption(id: this.id, tittle: "tittle"));
                    },
                    child: SizedBox(
                      width: 250,
                      child: Center(child: Text("Buy now")),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
