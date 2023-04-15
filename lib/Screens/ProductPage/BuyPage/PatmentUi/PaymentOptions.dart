import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/PaymentOptionUiController.dart';
import './widgets/InitialPaymentOptions.dart';
import 'package:verico/Constants/Constants.dart' as Constants;

class PaymentOption extends StatelessWidget {
  const PaymentOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var uiController = Get.put(PaymentUiController(), tag: "paymentUi");

    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag))
          ],
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.indigo,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
              ))),
      body: SingleChildScrollView(
        child: Obx(
          () {
            if ((uiController.currentStatus.value == 'Initialized')) {
              return InitialPaymentOptions();
            } else if ((uiController.currentStatus.value == 'processing')) {
              return Center(child: CircularProgressIndicator());
            } else if ((uiController.currentStatus.value == 'done')) {
              return Center(
                child: Column(
                  children: [
                    Text("PAYMENT SUCCESSFULL..."),
                    Text("Redirecting to Info Page"),
                  ],
                ),
              );
            } else if ((uiController.currentStatus.value == 'failed')) {
              return Center(
                child: Text("ORDER Failed"),
              );
            } else {
              return Center(child: Text("UI ERROR"));
            }
          },
        ),
      ),
    );
  }
}
