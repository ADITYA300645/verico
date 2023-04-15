import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Home/HomeView.dart';
import 'package:verico/Theme/ThemeController.dart';
import './CustomDrawerController.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeSwitchController = Get.put(CustomDrawerController());
    var themeController = Get.put(ThemeController());
    return SafeArea(
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  onTap: () {
                    //  Get.offUntil(page, (route) => (route as GetPageRoute).routeName == '/home')
                    // Get.offNamedUntil(page, ModalRoute.withName('/home'))
                    Get.back();
                  },
                  title: Text("home"),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  child: Container(
                    color: Colors.blueGrey,
                    height: 0.5,
                    width: MediaQuery.of(context).size.width - 150,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  onTap: () {},
                  title: Text("Settings"),
                ),
                Obx(
                  () => ListTile(
                      leading: Icon((themeSwitchController.isDark.value)
                          ? Icons.nights_stay
                          : Icons.sunny),
                      onTap: () {
                        themeSwitchController.toogleTheme();
                        themeController
                            .toggleTheme(themeSwitchController.isDark.value);
                      },
                      title: Text("IsDark"),
                      trailing: Switch(
                        onChanged: (value) {
                          themeSwitchController.toogleTheme();
                          themeController
                              .toggleTheme(themeSwitchController.isDark.value);
                        },
                        value: themeSwitchController.isDark.value,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
