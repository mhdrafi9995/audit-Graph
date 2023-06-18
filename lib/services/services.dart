import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:infotask/api-model/audit_graph.dart';
import 'package:infotask/api-model/audit_list.dart';
import 'package:infotask/api-model/home_data_model.dart';
import 'package:infotask/api-model/login_model.dart';

class ApiServices {
  static final Dio _dio = Dio();

  Future<LoginData> loginApi(String username, String password) async {
    try {
      Response response = await _dio.post(
        'https://www.petroinfotech.com/PetroHSE/api/Admin/ValidateLogin',
        data: {
          "userName": username,
          "password": password,
          "authType": "FORMS",
          "ipAddress": ""
        },
      );
      log('from login ${response.statusCode.toString()}');
      if (response.statusCode == 200) {
        // log(response.data.toString());
        String jsonString = json.encode(response.data);
        return loginDataFromJson(jsonString);
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
    throw Exception();
  }

  // Home screen api
  Future<HomeDataModel> getHomeData(String token, int id) async {
    try {
      Response response = await _dio.get(
        'https://www.petroinfotech.com/PetroHSE/api/Dashboard/GetHomePage?companyCode=1&userId=610',
        options: Options(
          headers: {
            "authorization": "bearer $token",
            "CompanyCode": 1,
            "UserId": id,
            "appType": "MOB",
            "content-type": "application/json",
            "accept": "application/json"
          },
        ),
      );
      log("from home api " + response.statusCode.toString());
      if (response.statusCode == 200) {
        // String jsonString = json.encode(response.data);
        return homeDataModelFromJson(response.data);
      }
    } on DioException catch (e) {
      log("From home api call : $e");
      throw Exception(e);
    }
    throw Exception();
  }

  Future<List<AuditGraph>> getAuditGrapgh(String token, int id) async {
    try {
      Response response = await _dio.get(
        'https://www.petroinfotech.com/PetroHSE/api/Audit/GetDashboardAuditList?UserCompanyCode=1&loggedInUserID=610',
        options: Options(
          headers: {
            "authorization": "bearer $token",
            "CompanyCode": 1,
            "UserId": id,
            "appType": "MOB",
            "content-type": "application/json",
            "accept": "application/json"
          },
        ),
      );
      log("from auditGraphApi ${response.statusCode.toString()}");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return auditGraphFromJson(jsonString);
      }
      throw Exception('${response.statusCode}\n${response.data}');
    } on DioException catch (e) {
      log("from audit graph api call : $e");
      throw Exception(e);
    }
  }

  Future<List<AuditList>> getAuditList(String token, int id) async {
    try {
      Response response = await _dio.get(
        'https://www.petroinfotech.com/PetroHSE/api/Audit/GetAuditList?mode=ALL&status=ALL',
        options: Options(
          headers: {
            "authorization": "bearer $token",
            "CompanyCode": 1,
            "UserId": id,
            "appType": "MOB",
            "content-type": "application/json",
            "accept": "application/json"
          },
        ),
      );
      log('from getAuditList: ${response.statusCode}');
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return auditListFromJson(jsonString);
      }
      throw Exception('${response.statusCode}\n${response.data}');
    } on DioException catch (e) {
      log('from getAuditList: $e');
      throw Exception(e);
    }
  }
}
