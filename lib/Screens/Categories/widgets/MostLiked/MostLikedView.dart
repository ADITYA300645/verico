import 'package:flutter/material.dart';
import 'package:verico/Screens/Categories/widgets/CardCarausal/CardCarousel.dart';

class MostLiked extends StatelessWidget {
  const MostLiked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14.0, top: 10),
          child: Text("Most-Liked",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(81, 86, 203, 1),
              )),
        ),
        CardCarousel()
      ],
    );
  }
}
