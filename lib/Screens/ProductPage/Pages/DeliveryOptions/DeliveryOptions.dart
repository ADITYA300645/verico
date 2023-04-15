import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/ProductPage/BuyPage/PatmentUi/PaymentOptions.dart';
import 'package:verico/Screens/ProductPage/BuyPage/controllers/PaymentRequestController.dart';
import 'package:verico/Screens/ProductPage/Pages/DeliveryOptions/DeliveryOptionController.dart';
import '../../BuyPage/Widgets/Heder.dart';

class DeliveryOptions extends StatelessWidget {
  const DeliveryOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deliveryOtionController = Get.put(DeliveryOptionController());
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Header(currentIndex: 1),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
              child: Container(
                height: 0.5,
                color: Colors.black,
                width: double.maxFinite,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text("Where should we Deliver it ? ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Obx(
                    () => ListView(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: [
                        //todo ezy implemnent \/
                        // RadioListTile(title: Text("data"), value: true, groupValue: , ,),
                        RadioListTile(
                          value: 1,
                          title: const Text("Standard"),
                          groupValue:
                              deliveryOtionController.currentSelection.value,
                          onChanged: (value) {
                            deliveryOtionController.setCurrentSelection(value!);
                          },
                        ),
                        RadioListTile(
                          value: 2,
                          title: const Text("Fast"),
                          groupValue:
                              deliveryOtionController.currentSelection.value,
                          onChanged: (value) {
                            deliveryOtionController.setCurrentSelection(value!);
                          },
                        ),
                        RadioListTile(
                          value: 3,
                          title: const Text("One Day"),
                          groupValue:
                              deliveryOtionController.currentSelection.value,
                          onChanged: (value) {
                            deliveryOtionController.setCurrentSelection(value!);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            var paymentController =
                Get.put(PaymentRequestController(), tag: "payment");
            paymentController.orderType = deliveryOtionController.selection;
            Get.to(PaymentOption(), transition: Transition.rightToLeft);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [Text("Next"), Icon(Icons.arrow_right)],
          )),
    );
  }
}
