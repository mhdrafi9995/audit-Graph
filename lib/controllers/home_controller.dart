import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:infotask/api-model/home_data_model.dart';
import 'package:infotask/services/services.dart';
import 'package:infotask/util/app_constants.dart';

class HomeController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<HomeDataModel> homeData = HomeDataModel().obs;

  Future<void> fetchHomeData() async {
    ApiServices apiServices = ApiServices();
    try {
      isLoading(true);
      // print(Constants.storage.read('token'));

      HomeDataModel data =
          await apiServices.getHomeData(Constants.token, Constants.userid);

      homeData.value = data;

      isLoading(false);
    } on SocketException catch (e) {
      log("from home controller $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }
}
