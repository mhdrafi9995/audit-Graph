// To parse this JSON data, do
//
//     final auditList = auditListFromJson(jsonString);

import 'dart:convert';

List<AuditList> auditListFromJson(String str) =>
    List<AuditList>.from(json.decode(str).map((x) => AuditList.fromJson(x)));

String auditListToJson(List<AuditList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuditList {
  int auditId;
  int headerId;
  int? scheduleId;
  int? templateId;
  int? conductedByEmp;
  dynamic hseComplaintRating;
  int uiid;
  dynamic auditTeam;
  String auditNo;
  String? auditType;
  String? auditTypeDesc;
  String? auditTitle;
  String? templateName;
  dynamic btnDeleteData;
  String? condutedByDept;
  String? condutedByDeptName;
  String conductedByEmpName;
  String? auditDesc;
  String? auditLocation;
  dynamic locationId;
  String? auditLocationDesc;
  String? reference;
  String auditStatus;
  dynamic actionId;
  dynamic closureComments;
  dynamic closureCode;
  dynamic closureCodeDesc;
  dynamic closedBy;
  bool isBtnStart;
  bool isBtnSave;
  bool isBtnFinalSave;
  bool isBtnFinish;
  bool isAuTab;
  DateTime? startDate;
  DateTime? endDate;
  dynamic closureDate;
  List<dynamic> attrValues;
  dynamic actionNo;
  dynamic priority;
  dynamic status;
  dynamic actionOwner;
  dynamic actionStatus;
  dynamic targetDate;
  dynamic year;
  int userId;
  int keyId;
  int companyCode;
  dynamic opsMode;
  dynamic appType;
  dynamic date1;
  dynamic date2;

  AuditList({
    required this.auditId,
    required this.headerId,
    this.scheduleId,
    this.templateId,
    this.conductedByEmp,
    this.hseComplaintRating,
    required this.uiid,
    this.auditTeam,
    required this.auditNo,
    this.auditType,
    this.auditTypeDesc,
    this.auditTitle,
    this.templateName,
    this.btnDeleteData,
    this.condutedByDept,
    this.condutedByDeptName,
    required this.conductedByEmpName,
    this.auditDesc,
    this.auditLocation,
    this.locationId,
    this.auditLocationDesc,
    this.reference,
    required this.auditStatus,
    this.actionId,
    this.closureComments,
    this.closureCode,
    this.closureCodeDesc,
    this.closedBy,
    required this.isBtnStart,
    required this.isBtnSave,
    required this.isBtnFinalSave,
    required this.isBtnFinish,
    required this.isAuTab,
    this.startDate,
    this.endDate,
    this.closureDate,
    required this.attrValues,
    this.actionNo,
    this.priority,
    this.status,
    this.actionOwner,
    this.actionStatus,
    this.targetDate,
    this.year,
    required this.userId,
    required this.keyId,
    required this.companyCode,
    this.opsMode,
    this.appType,
    this.date1,
    this.date2,
  });

  factory AuditList.fromJson(Map<String, dynamic> json) => AuditList(
        auditId: json["auditId"],
        headerId: json["headerId"],
        scheduleId: json["scheduleId"],
        templateId: json["templateId"],
        conductedByEmp: json["conductedByEmp"],
        hseComplaintRating: json["hseComplaintRating"],
        uiid: json["uiid"],
        auditTeam: json["auditTeam"],
        auditNo: json["auditNo"],
        auditType: json["auditType"],
        auditTypeDesc: json["auditTypeDesc"],
        auditTitle: json["auditTitle"],
        templateName: json["templateName"],
        btnDeleteData: json["btnDeleteData"],
        condutedByDept: json["condutedByDept"],
        condutedByDeptName: json["condutedByDeptName"],
        conductedByEmpName: json["conductedByEmpName"],
        auditDesc: json["auditDesc"],
        auditLocation: json["auditLocation"],
        locationId: json["locationId"],
        auditLocationDesc: json["auditLocationDesc"],
        reference: json["reference"],
        auditStatus: json["auditStatus"],
        actionId: json["actionId"],
        closureComments: json["closureComments"],
        closureCode: json["closureCode"],
        closureCodeDesc: json["closureCodeDesc"],
        closedBy: json["closedBy"],
        isBtnStart: json["isBtnStart"],
        isBtnSave: json["isBtnSave"],
        isBtnFinalSave: json["isBtnFinalSave"],
        isBtnFinish: json["isBtnFinish"],
        isAuTab: json["isAuTab"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        closureDate: json["closureDate"],
        attrValues: List<dynamic>.from(json["attrValues"].map((x) => x)),
        actionNo: json["actionNo"],
        priority: json["priority"],
        status: json["status"],
        actionOwner: json["actionOwner"],
        actionStatus: json["actionStatus"],
        targetDate: json["targetDate"],
        year: json["year"],
        userId: json["userId"],
        keyId: json["keyId"],
        companyCode: json["companyCode"],
        opsMode: json["opsMode"],
        appType: json["appType"],
        date1: json["date1"],
        date2: json["date2"],
      );

  Map<String, dynamic> toJson() => {
        "auditId": auditId,
        "headerId": headerId,
        "scheduleId": scheduleId,
        "templateId": templateId,
        "conductedByEmp": conductedByEmp,
        "hseComplaintRating": hseComplaintRating,
        "uiid": uiid,
        "auditTeam": auditTeam,
        "auditNo": auditNo,
        "auditType": auditType,
        "auditTypeDesc": auditTypeDesc,
        "auditTitle": auditTitle,
        "templateName": templateName,
        "btnDeleteData": btnDeleteData,
        "condutedByDept": condutedByDept,
        "condutedByDeptName": condutedByDeptName,
        "conductedByEmpName": conductedByEmpName,
        "auditDesc": auditDesc,
        "auditLocation": auditLocation,
        "locationId": locationId,
        "auditLocationDesc": auditLocationDesc,
        "reference": reference,
        "auditStatus": auditStatus,
        "actionId": actionId,
        "closureComments": closureComments,
        "closureCode": closureCode,
        "closureCodeDesc": closureCodeDesc,
        "closedBy": closedBy,
        "isBtnStart": isBtnStart,
        "isBtnSave": isBtnSave,
        "isBtnFinalSave": isBtnFinalSave,
        "isBtnFinish": isBtnFinish,
        "isAuTab": isAuTab,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "closureDate": closureDate,
        "attrValues": List<dynamic>.from(attrValues.map((x) => x)),
        "actionNo": actionNo,
        "priority": priority,
        "status": status,
        "actionOwner": actionOwner,
        "actionStatus": actionStatus,
        "targetDate": targetDate,
        "year": year,
        "userId": userId,
        "keyId": keyId,
        "companyCode": companyCode,
        "opsMode": opsMode,
        "appType": appType,
        "date1": date1,
        "date2": date2,
      };
}
