import 'package:get/get.dart';

class BottomBarController extends GetxController {
  RxInt currentPageIndex = 0.obs;
  void jumpTo(int value) {
    currentPageIndex.value = value;
    update(["one"]);
  }
}
