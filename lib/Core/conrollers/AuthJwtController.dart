import 'package:get/get.dart';
import 'package:hive/hive.dart';

class JWTController extends GetxController {
  RxString? token;
  var hiveBox = Hive.box("secretes");
  RxBool isAuthorised = false.obs;
  Future setAuthToken(String? token) async {
    await hiveBox.put("token", token);
    var lastToken = await hiveBox.get("token");
    if (lastToken != null) isAuthorised.value = true;
  }

  Future<String?> getAuthToken() async {
    var lastToken = await hiveBox.get("token");
    if (lastToken != null) {
      isAuthorised.value = true;
    }

    return await hiveBox.get("token");
  }

  @override
  void onInit() async {
    super.onInit();
    String? lastAuthToken = await getAuthToken();
    print(lastAuthToken);
    if (lastAuthToken == null) {
      print("NO AUTH");
    } else {
      print("AUTH");
      isAuthorised.value = true;
    }
  }
}
