import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:verico/Constants/Constants.dart' as Constants;
import 'package:verico/Core/conrollers/AuthJwtController.dart';
import 'package:verico/Screens/Account/LogIn/LoginView.dart';
import 'package:verico/Screens/Profile/ProfileModel.dart';

class ProfileController extends GetxController {
  var jwtController = Get.put(JWTController());
  Future<ProfileModel> getProfile() async {
    String? token = await jwtController.getAuthToken();
    Dio _dio = Dio();
    _dio.options.headers["Authorization"] = "Bearer $token";
    var response = await _dio.get("${Constants.Url}/user/userProfile");
    if (response.data["error"] == "e") {
      print(response.data["error"]);
      jwtController.setAuthToken(null);
      jwtController.isAuthorised.value = false;
      Get.showSnackbar(GetSnackBar(
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
          title: "Auuthorization Error",
          message: "Login Again Or Try Restating App"));
      return ProfileModel(name: "ERROR ");
    }
    var model = ProfileModel.fromJson(response.data);
    return model;
  }
}
