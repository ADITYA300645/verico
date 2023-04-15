import 'package:verico/Screens/ProductPage/Pages/AddressOptions/AddAddress/AddAddressView.dart';
import 'package:verico/Screens/ProductPage/Pages/DeliveryOptions/DeliveryOptions.dart';
import 'package:verico/Screens/ProductPage/BuyPage/controllers/PaymentRequestController.dart';
import './AddressOptionsController.dart';
import '../../BuyPage/Widgets/Heder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressOption extends StatelessWidget {
  String? tittle;
  String? id;
  AddressOption({Key? key, required this.id, required this.tittle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addressOptionsController = Get.put(AddressOptionController());

    int currentValue = 1;
    changeHandler(value) {
      print(value);
      currentValue = value;
    }

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
                var paymentController =
                    Get.put(PaymentRequestController(), tag: "payment");
                paymentController.productID = null;
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
            Header(currentIndex: 0),
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
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
              child: Text("Where should we Deliver it ? ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            Card(
              child: FutureBuilder(
                future: addressOptionsController.getAddresses(),
                builder: (context, snapshot) => ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: [
                    //todo ezy implemnent \/
                    // RadioListTile(title: Text("data"), value: true, groupValue: , ,),
                    RadioListTile(
                        toggleable: true,
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("NAME OF CUSTOMER"),
                              Text("1234567890"),
                              Text(
                                  "Address Of Customer  on a Lasrge Level to justify Its Ofdd")
                            ],
                          ),
                        ),
                        value: 1,
                        dense: true,
                        activeColor: Colors.indigo,
                        groupValue: currentValue,
                        onChanged: changeHandler),
                    RadioListTile(
                        toggleable: true,
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("NAME OF CUSTOMER"),
                              Text("1234567890"),
                              Text(
                                  "Address Of Customer  on a Lasrge Level to justify Its Ofdd")
                            ],
                          ),
                        ),
                        value: 2,
                        dense: true,
                        activeColor: Colors.indigo,
                        groupValue: currentValue,
                        onChanged: changeHandler),
                    ListTile(
                        onTap: () {
                          Get.to(AddAddress());
                        },
                        leading: Icon(Icons.add),
                        title: Text("Add New Address")),
                  ],
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
            paymentController.productID = this.id;
            Get.to(DeliveryOptions(), transition: Transition.rightToLeft);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [Text("Next"), Icon(Icons.arrow_right)],
          )),
    );
  }
}
