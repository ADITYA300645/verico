import 'package:dio/dio.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../../Constants/Constants.dart' as Constants;
import 'package:verico/Core/conrollers/AuthJwtController.dart';

class SignupController extends GetxController {
  var isSubmited = false.obs;
  var jwtController = Get.put(JWTController());
  Rx<XFile> image = XFile("assets/img.png").obs;
  RxString password = "".obs;
  RxString val = "".obs;
  RxString name = "".obs;

  RxBool isVisible = RxBool(false);
  RxBool isSelectd = false.obs;
  void tooglePasswordVisiblity(bool val) {
    isVisible = val.obs;
    print(isVisible.value);
    update();
  }

  void passwordChangeListner(String pass) {
    password = pass.obs;
    print(password.toString());
  }

  void valueChangeListner(String val) {
    this.val = val.obs;
  }

  void nameChangeListner(String val) {
    name = val.obs;
  }

  void setImage() async {
    image.value = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
    isSelectd.value = true;
    print("ended");
    update(['signup']);
  }

  Future sendSignUpReq() async {
    isSubmited.value = true;
    Dio _dio = Dio();
    FormData reqData = FormData.fromMap({
      "name": this.name.value.toString(),
      "email": this.val.value.toString(),
      "password": this.password.value.toString(),
      "profile": MultipartFile.fromFileSync(
        this.image.value.path.toString(),
      )
    });

    var response = await _dio.post("${Constants.Url}/user/signup",
        data: reqData, options: Options());
    var token = response.data["token"];
    var save = await jwtController.setAuthToken(token);
    jwtController.isAuthorised.value = true;
    Get.back();
    Get.back();
    return token;
  }
}
