import 'package:flutter/material.dart';
import 'package:verico/Screens/Categories/widgets/CardCarausal/CardCarousel.dart';
import 'package:verico/Screens/Categories/widgets/MoreInCategorie/MoreInCategorie.dart';
import 'package:verico/Screens/Categories/widgets/MostLiked/MostLikedView.dart';
import 'package:verico/Screens/Categories/widgets/NewInStore/NewItemsView.dart';
import 'package:verico/Screens/Categories/widgets/TopCategories/TopCategoriesView.dart';
import 'package:verico/Screens/Categories/widgets/TopRated/TopRatedView.dart';
import 'package:verico/Utils/CustomAppBar/CustomAppBar.dart';
import 'package:verico/Utils/CustomDrawer/CustomDrawer.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffordState = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffordState,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          foregroundColor: const Color.fromRGBO(81, 86, 203, 1),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              _scaffordState.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu_open, size: 32),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 14.0),
                child: Text("Categories",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(81, 86, 203, 1),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TopCategories(),
              CardCarousel(),
              TopRatedView(),
              MostLiked(),
              NewInStore(),
              MoreInCategorie()
            ],
          ),
        ));
  }
}
