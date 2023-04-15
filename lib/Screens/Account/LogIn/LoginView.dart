import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:verico/Screens/Account/LogIn/Utils/backgroundBasePainter.dart';
import './LoginController.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var valueController = TextEditingController();
    var passwordController = TextEditingController();
    var controller = Get.put(LoginController());
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [TextButton(onPressed: () {}, child: const Text("SignUp"))],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () => {Get.back(closeOverlays: true, canPop: true)},
          ),
          title: const Text("Loigin"),
        ),
        body: CustomPaint(
            painter: CurvePainter(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("", style: TextStyle(fontSize: 20.5)),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: valueController,
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
                  child: TextField(
                    controller: passwordController,
                    onChanged: (val) => controller.password,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.visibility_off_rounded),
                          onPressed: () {},
                        ),
                        hintText: "Password",
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size.fromHeight(45)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Log-in"),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.arrow_forward_rounded)
                          ],
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("New Here lets ..."),
                    TextButton(onPressed: () {}, child: const Text("Sign-up"))
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            )));
  }
}
