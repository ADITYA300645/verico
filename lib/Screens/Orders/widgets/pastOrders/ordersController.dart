import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:verico/Core/conrollers/AuthJwtController.dart';
import 'package:verico/Constants/Constants.dart' as Constants;
import 'package:verico/Screens/Orders/widgets/pastOrders/OrdersModel.dart';

class OrdersController extends GetxController {
  var jwtController = Get.put(JWTController());

  Future<Orders> fetchPastOrders() async {
    Dio _dio = Dio();
    var token = await jwtController.getAuthToken();
    _dio.options.headers["Authorization"] = "Bearer $token";
    var response = await _dio.get("${Constants.Url}/orders");
    return Orders.fromJson(response.data);
  }
}
