import 'package:flutter/material.dart';

class MoreInCategorie extends StatelessWidget {
  const MoreInCategorie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14.0, top: 10),
          child: Text("More in Categorie",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(81, 86, 203, 1),
              )),
        ),
        GridView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Card(
                    child: Container(
                        height: 170, width: 170, child: Text("${index}")),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("title"), Text("price")],
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
