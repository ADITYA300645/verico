import 'dart:typed_data';

class CarouselCardModel {
  List<CardInfo>? cards;
  CarouselCardModel({required this.cards});

  CarouselCardModel.fromJson(Map<String, dynamic> json) {
    if (cards == null) {
      cards = [];
      json["products"].forEach((e) {
        cards!.add(CardInfo.fromJson(e));
      });
    }
  }
}

class CardInfo {
  String? name;
  int? price;
  String? id;

  CardInfo({this.name, this.price, this.id});
  CardInfo.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    price = json["price"];
    name = json["name"];
  }
}
