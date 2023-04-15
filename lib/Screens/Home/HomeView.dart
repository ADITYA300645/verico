import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Home/HomeUtils/TrendingPosts/TrendingPost.dart';
import './HomeUtils/TrendingProducts/TrendingProducts.dart';
import 'package:verico/Screens/Home/HomeUtils/LastSearchRecomandation/LastSearch.dart';
import 'package:verico/Screens/Home/HomeUtils/StoriesView/StoriesView.dart';
import 'package:verico/Screens/Home/HomeUtils/TopRated/TopRated.dart';
import './HomeUtils/ChangingBanner/ChangingBanner.dart';
import 'package:verico/Screens/Search/SerchView.dart';
import 'package:verico/Utils/CustomDrawer/CustomDrawer.dart';
import 'package:verico/Utils/CustomAppBar/CustomAppBar.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _sacffoldKey =
        new GlobalKey<ScaffoldState>();
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChangingBanner(),
            StoriesView(),
            TopRated(),
            LastSearch(),
            TrendingProducts(),
            TrendingPosts()
          ],
        ),
      ),
    );
  }
}
