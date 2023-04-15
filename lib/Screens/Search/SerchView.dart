import 'package:flutter/material.dart';
import 'package:verico/Screens/Search/SearchBar/SearchBarView.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(),
      body: Center(
        child: Text("Search For Item You Need"),
        // todo : Implement Search Function In Backend and Fronend
      ),
    );
  }
}
