import 'package:get/get.dart';

class PaymentUiController extends GetxController {
  var currentStatus = "Initialized".obs;
  setCurrentState(String value) {
    currentStatus.value = value;
    update(["paymentUi"]);
  }
}
