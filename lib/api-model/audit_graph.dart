// To parse this JSON data, do
//
//     final auditGraph = auditGraphFromJson(jsonString);

import 'dart:convert';

List<AuditGraph> auditGraphFromJson(String str) =>
    List<AuditGraph>.from(json.decode(str).map((x) => AuditGraph.fromJson(x)));

String auditGraphToJson(List<AuditGraph> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuditGraph {
  String item;
  int count;
  String colour;
  String icon;
  String screenUrl;
  String screenCode;
  String screenTitle;

  AuditGraph({
    required this.item,
    required this.count,
    required this.colour,
    required this.icon,
    required this.screenUrl,
    required this.screenCode,
    required this.screenTitle,
  });

  factory AuditGraph.fromJson(Map<String, dynamic> json) => AuditGraph(
        item: json["Item"],
        count: json["Count"],
        colour: json["Colour"],
        icon: json["Icon"],
        screenUrl: json["ScreenUrl"],
        screenCode: json["ScreenCode"],
        screenTitle: json["ScreenTitle"],
      );

  Map<String, dynamic> toJson() => {
        "Item": item,
        "Count": count,
        "Colour": colour,
        "Icon": icon,
        "ScreenUrl": screenUrl,
        "ScreenCode": screenCode,
        "ScreenTitle": screenTitle,
      };
}
