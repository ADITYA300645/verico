import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Account/SignUp/SignUpController.dart';
import 'package:verico/Utils/BottomBarController.dart';
import 'package:verico/Utils/customBottomBar.dart';
import 'package:verico/main.dart';

class ProfileUploadView extends StatelessWidget {
  const ProfileUploadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var signUpController = Get.put(SignupController(), tag: 'signup');

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => {Get.back(closeOverlays: true, canPop: true)},
        ),
        title: const Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: GestureDetector(
            onTap: () async {
              signUpController.setImage();
            },
            child: Column(
              children: [
                GetX<SignupController>(
                    init: SignupController(),
                    tag: "signup",
                    builder: (val) => (val.isSelectd.isTrue)
                        ? Container(
                            height: 350,
                            width: 350,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(500))),
                            child: Image.file(
                                fit: BoxFit.cover,
                                File(val.image.value.path.toString())))
                        : Image.asset("assets/img.png")),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: TextField(
                    controller: nameController,
                    onChanged: signUpController.nameChangeListner,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.account_circle_rounded),
                        hintText: "Your Name",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          signUpController.sendSignUpReq();
                          var bottomBarController =
                              Get.put(BottomBarController(), tag: "one");
                          bottomBarController.jumpTo(0);
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size.fromHeight(45)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(() => (signUpController.isSubmited.value)
                                ? const Text("Submit")
                                : const Text("Submit")),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(Icons.arrow_forward_rounded)
                          ],
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
