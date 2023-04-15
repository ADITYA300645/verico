import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:verico/Screens/Account/LogIn/LoginView.dart';
import 'package:verico/Screens/Account/SignUp/SignUpView.dart';

class TopProducts extends StatelessWidget {
  const TopProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int randomC() {
      var random = Random();
      var val = random.nextInt(255);
      return val;
    }

    return Text("TOP PRODUCT");
  }
}
