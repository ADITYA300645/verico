import 'package:flutter/material.dart';

class NewInStore extends StatelessWidget {
  const NewInStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14.0, top: 10),
          child: Text("New in Store",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(81, 86, 203, 1),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 24,
            child: Container(
              height: 400,
              width: 400,
              //todo: Slide changing Animation in code
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    height: 130,
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            child: Container(
              height: 27.5,
              child: Center(
                child: Text("Show more"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
