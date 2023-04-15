import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'SearchBarController.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchBarController = Get.put(SearchBarController());
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(5),
      child: SizedBox(
        width: (MediaQuery.of(context).size.width - 10),
        child: TextField(
          controller: searchBarController.controller.value,
          onChanged: searchBarController.onChage,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              prefixIcon: IconButton(
                onPressed: () {
                  Get.back(canPop: true);
                },
                icon: Icon(Icons.arrow_back),
              ),
              suffixIcon:
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              // suffix: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              border: const OutlineInputBorder(
                  gapPadding: 100,
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
        ),
      ),
    ));
  }

  @override
  Size get preferredSize => Size(100, 70);
}
