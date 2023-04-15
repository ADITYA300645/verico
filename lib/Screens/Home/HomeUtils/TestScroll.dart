import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/ScrollableController.dart';

class TestScroll extends StatelessWidget {
  const TestScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller =
        Get.put(ScrollableController(), tag: "home", permanent: true);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 500,
          ),
          Container(
            color: Colors.pink,
            height: 500,
          ),
          Container(
            color: Colors.yellow,
            height: 500,
          ),
          Container(
            color: Colors.red,
            height: 500,
          ),
          Container(
            color: Colors.blue,
            height: 500,
          ),
          Container(
            color: Colors.green,
            height: 500,
          ),
        ],
      ),
    );
  }
}
