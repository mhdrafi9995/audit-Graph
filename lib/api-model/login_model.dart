// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  int? id;
  dynamic firstName;
  dynamic lastName;
  dynamic username;
  dynamic password;
  String? pwdPrompt;
  dynamic confirmPassword;
  String? token;
  String? message;
  int? compCode;
  dynamic module;
  int? msgType;
  dynamic authType;
  dynamic ipAddress;

  LoginData({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.password,
    this.pwdPrompt,
    this.confirmPassword,
    this.token,
    this.message,
    this.compCode,
    this.module,
    this.msgType,
    this.authType,
    this.ipAddress,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        password: json["password"],
        pwdPrompt: json["pwdPrompt"],
        confirmPassword: json["confirmPassword"],
        token: json["token"],
        message: json["message"],
        compCode: json["compCode"],
        module: json["module"],
        msgType: json["msgType"],
        authType: json["authType"],
        ipAddress: json["ipAddress"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "password": password,
        "pwdPrompt": pwdPrompt,
        "confirmPassword": confirmPassword,
        "token": token,
        "message": message,
        "compCode": compCode,
        "module": module,
        "msgType": msgType,
        "authType": authType,
        "ipAddress": ipAddress,
      };
}
