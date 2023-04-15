import 'dart:core';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:verico/Screens/ProductPage/Pages/AddressOptions/AddAddress/AddressModel.dart';
import 'package:verico/Screens/ProductPage/Pages/AddressOptions/AddressOptionsController.dart';

class AddressModel {
  String? name;
  int? phoneNo;
  int? pinCode;
  String? locality;
  String? AddressLine;
  AddressModel(
      {this.name, this.AddressLine, this.locality, this.phoneNo, this.pinCode});
}
