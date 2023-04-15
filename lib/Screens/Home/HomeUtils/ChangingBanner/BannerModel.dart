class Banner {
  List<String>? ProductIds = [];
  Banner({this.ProductIds});
  Banner.fromJson(Map<String, dynamic> json) {
    var products = json["products"];
    ProductIds = [];
    products.forEach((e) {
      ProductIds!.add(e["_id"]);
    });
  }
}
