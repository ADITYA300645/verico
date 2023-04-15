import 'dart:typed_data';

class TrendingProductModel {
  List<Product>? products;
  TrendingProductModel({required this.products});

  TrendingProductModel.fromJson(Map<String, dynamic> json) {
    if (products == null) {
      products = [];
      json["products"].forEach((e) => {products!.add(Product.fromJson(e))});
    }
  }
}

class Product {
  String? id;
  int? price;
  String? name;
  Product({
    required this.id,
    required this.name,
    required this.price,
  });
  Product.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    price = json["price"];
  }
}
