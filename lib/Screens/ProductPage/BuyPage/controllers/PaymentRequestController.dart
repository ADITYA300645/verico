import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;
import 'package:verico/Constants/Constants.dart' as Constants;
import 'package:verico/Core/conrollers/AuthJwtController.dart';
import '../../Pages/OrderPlaced/OrderPlaced.dart';

class PaymentRequestController extends GetxController {
  var jwtController = Get.put(JWTController());
  String? productID;
  String? address;
  int? quantity;
  String? orderType;

  Future requestOrder() async {
    Dio _dio = Dio();
    var token = await jwtController.getAuthToken();

    _dio.options.headers["Authorization"] = "Bearer $token";
    var obj = {
      "productId": productID,
      "quantity": quantity,
      "orderType": orderType,
      "orderAddress": address,
    };
    try {
      var response = await _dio
          .post(
        data: obj,
        "${Constants.Url}/orders/order",
      )
          .catchError((e) {
        print("ERRPOR COUT");
        print(e);
        return "error";
      });
      print(response);
      if (response == null) {
        print("NOT AVAILABLE");
        return "error";
      }
      if (response.data["status"] == "success") {
        Future.delayed(Duration(seconds: 1), () => Get.to(OrderPlaced()));
      }

      return response.data;
    } catch (e) {
      return null;
    }
  }
}
