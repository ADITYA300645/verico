import 'package:get/get.dart';

class CustomDrawerController extends GetxController {
  RxBool isDark = false.obs;
  void toogleTheme() {
    this.isDark.value = !this.isDark.value;
    update();
  }
}
