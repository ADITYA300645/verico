import 'package:flutter/material.dart';

class LastSearch extends StatelessWidget {
  const LastSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 18.0),
          child: const Text("From last time",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(81, 86, 203, 1),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: 4,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Card(
              color: Colors.indigo,
            );
          },
        )
      ],
    );
  }
}
