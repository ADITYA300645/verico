import 'package:intl/intl.dart';

class Orders {
  List<Order>? ordersList;
  Orders.fromJson(Map<String, dynamic> json) {
    var orders = json["orders"];
    ordersList = [];
    orders.forEach((order) {
      ordersList!.add(Order.fromJson(order));
    });
  }
}

class Order {
  String? productId;
  String? orderId;
  int? quantity;
  int? effectivePrice;
  String? orderAddress;
  DateTime? orderDate;

  Order.fromJson(Map<String, dynamic> json) {
    productId = json["productId"];
    orderId = json["_id"];
    quantity = json["quantity"];
    effectivePrice = json["buyTimePrice"];
    orderAddress = json["orderAddress"];
    orderDate = DateTime.parse(json["orderDate"]);
  }
}
