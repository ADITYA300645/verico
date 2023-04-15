import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  int? currentIndex;
  Header({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> names = ["Address", "Delivery", "Payment", "Place Order"];
    List<Text> widgets = List.generate(
        4,
        (index) => (index == currentIndex)
            ? Text(names[index],
                style: const TextStyle(
                    color: Colors.indigo,
                    fontSize: 18,
                    fontWeight: FontWeight.w500))
            : Text(
                names[index],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ));

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widgets);
  }
}
