import 'package:flutter/material.dart';
import 'package:verico/Screens/Orders/widgets/ContinueSearch/ContinueSearch.dart';
import 'package:verico/Screens/Orders/widgets/OrdersOptions/OrdersOptions.dart';
import 'package:verico/Screens/Orders/widgets/pastOrders/Orders.dart';
import 'package:verico/Screens/Search/SerchView.dart';
import 'package:verico/Utils/CustomAppBar/CustomAppBar.dart';
import 'package:get/get.dart';
import 'package:verico/Utils/CustomDrawer/CustomDrawer.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _sacffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _sacffoldKey,
      drawer: const CustomDrawer(),
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
          children: [PastOrders(), OrdersOptions(), ContinueSearch()],
        ),
      ),
    );
  }
}
