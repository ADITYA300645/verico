import 'package:flutter/material.dart';
import 'package:verico/Screens/ProductPage/BuyPage/controllers/PaymentOptionUiController.dart';
import 'package:verico/Screens/ProductPage/BuyPage/controllers/PaymentRequestController.dart';
import '../../Widgets/Heder.dart';
import 'package:pay/pay.dart';
import 'package:get/get.dart';
import 'package:verico/Constants/Constants.dart' as Constants;

class InitialPaymentOptions extends StatelessWidget {
  const InitialPaymentOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _paymentItems = [
      PaymentItem(
        label: 'Total',
        amount: '99.99',
        status: PaymentItemStatus.final_price,
      )
    ];

    var uiController = Get.put(PaymentUiController(), tag: "paymentUi");
    var paymentRequestController =
        Get.put(PaymentRequestController(), tag: "payment");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Header(currentIndex: 2),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
          child: Container(
            height: 0.5,
            color: Colors.black,
            width: double.maxFinite,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: 120,
                color: Colors.indigo,
              ),
              Column(
                children: [
                  const Text("NAME OF THE PRODUCT"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(onPressed: () {}, child: const Text("--")),
                      const Text("1"),
                      TextButton(onPressed: () {}, child: const Text("+")),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: Text("Select Payment Option and Proceed",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // GooglePayButton(
              //   paymentConfiguration: PaymentConfiguration.fromJsonString(
              //       Constants.defaultGooglePay),
              //   paymentItems: _paymentItems,
              //   type: GooglePayButtonType.pay,
              //   margin: const EdgeInsets.only(top: 15.0),
              //   loadingIndicator: const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              //   onPaymentResult: (Map<String, dynamic> result) {
              //     print(result);
              //   },
              // ),
              ElevatedButton(
                  onPressed: () async {
                    uiController.setCurrentState("processing");
                    var value = await paymentRequestController.requestOrder();
                    if (value == "error") {
                      return uiController.setCurrentState("failed");
                    } else if (value["status"] == "success") {
                      uiController.setCurrentState("done");
                    } else if (value["status"] == "failed") {
                      uiController.setCurrentState("failed");
                    }

                    print(uiController.currentStatus.value);
                  },
                  child: Text("emulate Payment"))
            ],
          ),
        ),
      ],
    );
    ;
  }
}
