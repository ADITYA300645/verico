import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verico/Utils/ScrollableController.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  List<Widget> leading = [
    IconButton(onPressed: () {}, icon: Icon(Icons.menu_open_rounded))
  ];
  List<Widget> trailing = [];
  CustomAppBar({Key? key, required this.leading, required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller =
        Get.put(ScrollableController(), tag: "home", permanent: true);
    return SafeArea(
      child: Material(
        animationDuration: Duration(milliseconds: 500),
        elevation: (controller.isScrolled.value) ? 0 : 0,
        child: Container(
          height: 55,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Row(children: leading), Row(children: trailing)],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window)
          .size
          .width
          .toDouble(),
      80);
}
