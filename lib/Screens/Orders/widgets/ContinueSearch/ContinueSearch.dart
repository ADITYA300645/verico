import 'package:flutter/material.dart';

class ContinueSearch extends StatelessWidget {
  const ContinueSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 14.0),
          child: Text("Continue where you left",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(81, 86, 203, 1),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          child: GridView.builder(
            padding: const EdgeInsets.all(5),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  width: 100,
                  child: Center(child: Text("${index + 1}")),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
