import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString _password = "".obs;

  String get password => _password.value;

  set password(String password) {
    _password.value = password;
  }

  RxString _value = "".obs;

  String get value => _value.value;

  set value(String value) {
    _value.value = value;
  }
}
