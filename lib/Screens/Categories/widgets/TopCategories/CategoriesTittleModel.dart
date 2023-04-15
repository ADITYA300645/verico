class CategoriesTittles {
  List<String>? tittles;
  CategoriesTittles({required this.tittles});
  CategoriesTittles.fromJson(Map<String, dynamic> json) {
    if (tittles == null) {
      tittles = ["All"];
      json["categories"].forEach((category) {
        tittles!.add(category["categorieName"].toString());
      });
    }
  }
}
