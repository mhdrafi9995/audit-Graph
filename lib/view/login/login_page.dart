import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infotask/controllers/login_controller.dart';
import 'package:infotask/util/responces.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController getxController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 100, top: 40, right: 100),
                    child:
                        Image.asset("assets/images/company-logo-name (1).png")),
                SizedBox(
                  height: R.sh(150, context),
                ),
                Padding(
                  padding: EdgeInsets.only(right: R.sw(220, context)),
                  child: Text(
                    "User Name",
                    style: TextStyle(
                        fontSize: R.sw(16, context),
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: R.sh(12, context),
                ),
                Container(
                  width: R.sw(340, context),
                  height: R.sh(58, context),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: TextField(
                    controller: getxController.username,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Enter User name',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                SizedBox(
                  height: R.sh(18, context),
                ),
                Padding(
                  padding: EdgeInsets.only(right: R.sw(220, context)),
                  child: Text(
                    "Passowrd",
                    style: TextStyle(
                        fontSize: R.sw(16, context),
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: R.sh(10, context),
                ),
                Container(
                  width: R.sw(340, context),
                  height: R.sh(58, context),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    obscureText: getxController.isVisible.value,
                    controller: getxController.password,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: 'Enter Password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                            onPressed: () {
                              getxController.isVisible.value =
                                  !getxController.isVisible.value;
                            },
                            icon: Icon(getxController.isVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off))
                        //

                        ),
                  ),
                ),
                SizedBox(
                  height: R.sh(2, context),
                ),
                Padding(
                    padding: EdgeInsets.only(left: R.sw(200, context)),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "forgot Password",
                          style: TextStyle(color: Colors.grey),
                        ))),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: getxController.isLoading.value
                      ? null
                      : () async {
                          if (getxController.username.text != '' &&
                              getxController.password.text != '') {
                            await getxController.loginApiCall();
                            if (getxController.loginData.value.token == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Username or password is wrong',
                                  ),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Username and password can\'t be empty',
                                ),
                              ),
                            );
                          }
                        },
                  borderRadius: BorderRadius.circular(16),
                  child: Ink(
                    width: R.sw(340, context),
                    height: R.sh(58, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFF38AAE1),
                    ),
                    child: Center(
                      child: getxController.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: R.sw(22, context),
                                  fontWeight: FontWeight.w600),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
