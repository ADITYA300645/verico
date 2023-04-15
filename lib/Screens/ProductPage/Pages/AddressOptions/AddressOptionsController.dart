import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:verico/Screens/ProductPage/Pages/AddressOptions/AddAddress/AddressModel.dart';

class AddressOptionController extends GetxController {
  RxString? address;
  var hiveBox = Hive.box("addressBox");

  Future addAddress(AddressModel address) async {
    var addressesList = await hiveBox.get("address");
    if (addressesList == null) {
      addressesList = [];
    }
    addressesList.add(address);
    await hiveBox.put("address", addressesList);
  }

  Future<List<AddressModel>> getAddresses() async {
    var addresses = await hiveBox.get("address");
    print(addresses);
    return addresses;
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
