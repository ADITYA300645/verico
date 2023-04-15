import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:verico/Core/conrollers/AuthJwtController.dart';
import 'package:verico/Screens/Account/SignUp/SignUpView.dart';
import 'package:verico/Screens/Explore/ExploreView.dart';
import 'package:verico/Screens/Home/HomeView.dart';
import 'package:verico/Screens/Orders/OrdersView.dart';
import 'package:verico/Screens/Profile/ProfileView.dart';
import 'package:verico/Theme/ThemeController.dart';
import 'package:verico/Theme/themeConstants.dart';
import 'package:verico/Utils/Binding.dart';
import 'package:verico/Utils/BottomBarController.dart';
import 'package:verico/Utils/customBottomBar.dart';
import 'package:path_provider/path_provider.dart';
import './Screens/Categories/CategoriesView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox("secretes");
  // await Hive.openBox("addressBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.put(JWTController(), permanent: true);
    var themeController = Get.put(ThemeController());
    return Obx(
      () => GetMaterialApp(
          initialBinding: BindingsBuilder.put(() => BottomAppBarBinding()),
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeController.themeMode,
          home: authController.isAuthorised.value
              ? const MainPage()
              : const MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authController = Get.put(JWTController(), permanent: true);

    // experiment functions
    void makeNull() {
      authController.setAuthToken(null);
    }

    doWork() async {
      print(authController.isAuthorised.value);
    }

    final controller = Get.put(BottomBarController(), tag: "one");
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Container(
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  makeNull();
                },
                child: Text("Null"),
              ),
              FloatingActionButton(
                child: Text("PRINT"),
                onPressed: () {
                  doWork();
                },
              ),
            ],
          ),
        ),
        body: Obx(
          () {
            List<Widget> widgets = [
              HomeView(),
              const CategoriesView(),
              const Orders(),
              authController.isAuthorised.value
                  ? const Profile()
                  : SignupView(isFromHome: true),
              const ExploreView()
            ];
            return widgets[controller.currentPageIndex.value];
          },
        ),
        bottomNavigationBar: CustomBottomBar());
  }
}
