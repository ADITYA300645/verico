import 'package:flutter/material.dart';

class OrdersOptions extends StatelessWidget {
  const OrdersOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            Text("OPTIONS"),
            Card(
              child: ListTile(
                title: Text("data"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
