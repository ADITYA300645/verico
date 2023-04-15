import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchBarController extends GetxController {
  var controller = TextEditingController().obs;
  void onChage(val) {
    print(val);
  }
}
