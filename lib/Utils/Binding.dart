import 'package:get/get.dart';
import 'package:verico/Utils/BottomBarController.dart';

class BottomAppBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BottomBarController>(BottomBarController());
  }
}
