import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infotask/api-model/login_model.dart';
import 'package:infotask/services/services.dart';
import 'package:infotask/util/app_constants.dart';
import 'package:infotask/view/common/bottom_nav.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  Rx<bool> isVisible = true.obs;
  Rx<bool> isLoading = false.obs;

  Rx<LoginData> loginData = LoginData(
    id: 0,
    firstName: null,
    lastName: null,
    username: null,
    password: null,
    pwdPrompt: null,
    confirmPassword: null,
    token: null,
    message: '',
    compCode: 0,
    module: null,
    msgType: 0,
    authType: null,
    ipAddress: null,
  ).obs;

  Future<void> loginApiCall() async {
    ApiServices apiServices = ApiServices();
    try {
      isLoading(true);
      LoginData validateLogin =
          await apiServices.loginApi(username.text, password.text);
      loginData.value = validateLogin;
      Constants.storage.write("token", loginData.value.token);
      Constants.storage.write("userid", loginData.value.id);
      Constants.token = Constants.storage.read('token');
      Constants.userid = Constants.storage.read('userid');
      log('from loginApiCall ${Constants.storage.read('token')}');
      if (loginData.value.id == 610) {
        Get.offAll(() => const BottomNav());
      }
    } catch (e) {
      log("from login  $e");
    } finally {
      isLoading(false);
    }
  }
}
