import 'dart:typed_data';
import 'package:verico/Constants/Constants.dart' as Constants;
import 'package:flutter/material.dart';
import 'package:verico/Core/conrollers/AuthJwtController.dart';
import 'package:verico/Screens/Search/SerchView.dart';
import 'package:verico/Utils/CustomDrawer/CustomDrawer.dart';
import 'package:get/get.dart';
import 'ProfileController.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _sacffoldKey =
        new GlobalKey<ScaffoldState>();
    var jwtController = Get.put(JWTController());
    ;
    var token = jwtController.getAuthToken();
    var profileController = Get.put(ProfileController());
    return Scaffold(
      key: _sacffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(
                      transition: Transition.rightToLeft, const SearchView());
                },
                icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag))
          ],
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.indigo,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                _sacffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu_open_sharp))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: profileController.getProfile(),
              builder: (context, snapshot) => Container(
                height: 450,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (snapshot.hasData)
                          ? Container(
                              height: 320,
                              width: 320,
                              decoration: BoxDecoration(
                                  gradient: const SweepGradient(colors: [
                                    Colors.indigoAccent,
                                    Colors.purple,
                                    Colors.indigo,
                                    Colors.deepPurple,
                                    Colors.purple,
                                    Colors.indigo,
                                    Colors.deepPurple,
                                    Colors.indigo,
                                    Colors.indigoAccent,
                                  ]),
                                  borderRadius: BorderRadius.circular(2500),
                                  color: Colors.pink),
                              child: Center(
                                child: Container(
                                  height: 300,
                                  width: 300,
                                  child: CircleAvatar(
                                    backgroundImage: MemoryImage(
                                        Uint8List.fromList(
                                            snapshot.data!.profileImage ?? [])),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2500),
                                  color: Colors.grey),
                              height: 320,
                              width: 320,
                              child: const Center(
                                  child: CircularProgressIndicator()),
                            ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: (snapshot.hasData)
                            ? Text(snapshot.data!.name ?? "No Name",
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ))
                            : const Text("...",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: const [Text("Followers"), Text("69k")],
                            ),
                            Column(
                              children: const [Text("Following"), Text("69k")],
                            ),
                            Column(
                              children: const [Text("Likes"), Text("69")],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 42.0, vertical: 0),
              child: Container(
                color: Colors.grey,
                height: 1,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.dashboard_outlined)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.api_outlined)),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 42.0, vertical: 0),
              child: Container(
                color: Colors.grey,
                height: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => Card(
                  child: Container(
                    height: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
