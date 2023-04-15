import 'package:flutter/material.dart';
import 'package:verico/Screens/Account/LogIn/LoginView.dart';
import 'package:verico/Screens/Account/LogIn/Utils/backgroundBasePainter.dart';
import 'package:get/get.dart';
import 'package:verico/Screens/Account/SignUp/SignUpController.dart';
import 'package:verico/Screens/Account/SignUp/pages/ProfileUpload.dart';

class SignupView extends StatelessWidget {
  bool isFromHome = false;
  SignupView({Key? key, bool? isFromHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var valueController = TextEditingController();
    var controller = Get.put(SignupController(), tag: 'signup');
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Get.to(LoginView(), transition: Transition.rightToLeft);
              },
              child: Text("login"))
        ],
        leading: (this.isFromHome)
            ? IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => {Get.back(closeOverlays: true, canPop: true)},
              )
            : null,
        title: const Text("Register"),
      ),
      body: Container(
        child: CustomPaint(
            painter: CurvePainter(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Lets Sign Up !", style: TextStyle(fontSize: 20.5)),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: valueController,
                    onChanged: controller.valueChangeListner,
                    decoration: const InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                        suffixIcon: Icon(Icons.phone),
                        hintText: "Phone or Email Id",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GetBuilder<SignupController>(
                    tag: 'signup',
                    builder: (val) => TextField(
                      obscureText: controller.isVisible.value,
                      controller: passwordController,
                      onChanged: controller.passwordChangeListner,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: (controller.isVisible.value)
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off_rounded),
                              onPressed: () =>
                                  controller.tooglePasswordVisiblity(
                                      !controller.isVisible.value)),
                          hintText: "Password",
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(
                              transition: Transition.rightToLeft,
                              ProfileUploadView());
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size.fromHeight(45)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Next"),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.arrow_forward_rounded)
                          ],
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already A User "),
                    TextButton(onPressed: () {}, child: const Text("Log-in"))
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            )),
      ),
    );
  }
}
