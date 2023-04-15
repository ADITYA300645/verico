import 'package:get/get.dart';

class ScrollableController extends GetxController {
  RxBool isScrolled = false.obs;
  void setIsScrolled(bool val) {
    isScrolled.value = val;
    print(isScrolled);
    update();
  }
}
