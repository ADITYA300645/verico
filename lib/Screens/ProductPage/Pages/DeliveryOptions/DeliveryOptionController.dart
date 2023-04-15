import 'package:get/get.dart';

class DeliveryOptionController extends GetxController {
  var options = ["normal", "fast", "oneDay"];
  var currentSelection = 1.obs;
  var selection = "normal";
  setCurrentSelection(int val) {
    this.currentSelection.value = val;
    selection = options[currentSelection.value - 1];
    update();
  }
}
