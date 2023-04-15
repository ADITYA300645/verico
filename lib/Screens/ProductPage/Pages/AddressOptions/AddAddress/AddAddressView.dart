import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/ProductPage/Pages/AddressOptions/AddAddress/AddressModel.dart';
import 'package:verico/Screens/ProductPage/Pages/AddressOptions/AddressOptionsController.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addressModel = new AddressModel();
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
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  addressModel.name = value;
                },
                decoration: InputDecoration(
                    label: Text("NAME"), border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  addressModel.phoneNo = int.parse(value);
                },
                decoration: InputDecoration(
                    label: Text("Phone No"), border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  addressModel.pinCode = int.parse(value);
                },
                decoration: InputDecoration(
                    label: Text("PinCode"), border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  addressModel.locality = value;
                },
                decoration: InputDecoration(
                    label: Text("Locality / House No"),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  addressModel.AddressLine = value;
                },
                maxLines: 5,
                decoration: InputDecoration(
                    label: Text("Address Line Indication"),
                    border: OutlineInputBorder()),
              ),
            )
          ],
        ),
      )),
      floatingActionButton: Container(
          width: 300,
          child: ElevatedButton(
              onPressed: () {
                var addressOptionController =
                    Get.put(AddressOptionController());
                addressOptionController.addAddress(addressModel);
              },
              child: Text("ADD"))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
