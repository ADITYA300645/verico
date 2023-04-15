import 'package:flutter/material.dart';
import 'package:verico/Screens/Categories/widgets/TopRated/LisAnimation.dart';

class TopRatedView extends StatelessWidget {
  const TopRatedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14.0, top: 10),
          child: Text("Top-Rated",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(81, 86, 203, 1),
              )),
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
