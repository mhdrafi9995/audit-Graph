import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:infotask/api-model/audit_graph.dart';
import 'package:infotask/api-model/audit_list.dart';
import 'package:infotask/util/app_constants.dart';

import '../services/services.dart';

class GraphController extends GetxController {
  Rx<bool> isLoading = false.obs;
  RxList<AuditGraph> auditGraphData = <AuditGraph>[].obs;
  RxList<AuditList> auditListData = <AuditList>[].obs;
  ApiServices apiServices = ApiServices();

  Future<void> fecthGraph() async {
    try {
      List<AuditGraph> data =
          await apiServices.getAuditGrapgh(Constants.token, Constants.userid);
      auditGraphData.value = data;
    } on SocketException catch (e) {
      log("from graphController : $e");
      throw Exception(e);
    }
  }

  Future<void> fetchAuditList() async {
    ApiServices apiServices = ApiServices();
    try {
      List<AuditList> data =
          await apiServices.getAuditList(Constants.token, Constants.userid);
      auditListData.value = data;
    } on SocketException catch (e) {
      log('from fetchAuditList : $e');
      throw Exception(e);
    }
  }

  void fetchDatas() {
    isLoading(true);
    fecthGraph();
    fetchAuditList();
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    fetchDatas();
  }
}
