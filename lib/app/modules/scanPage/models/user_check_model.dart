// To parse this JSON data, do
//
//     final userCheckModel = userCheckModelFromJson(jsonString);

import 'dart:convert';

UserCheckModel userCheckModelFromJson(String str) => UserCheckModel.fromJson(json.decode(str));

String userCheckModelToJson(UserCheckModel data) => json.encode(data.toJson());

class UserCheckModel {
  UserCheckModel({
    this.success,
    this.message,
    this.data,
    this.queries,
  });

  bool? success;
  String? message;
  dynamic data;
  Queries? queries;

  factory UserCheckModel.fromJson(Map<String, dynamic> json) => UserCheckModel(
    success: json["success"],
    message: json["message"],
    data: json["data"],
    queries: Queries.fromJson(json["queries"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data,
    "queries": queries!.toJson(),
  };
}

class Queries {
  Queries({
    this.log,
    this.time,
    this.duplicates,
  });

  List<dynamic>? log;
  int? time;
  int? duplicates;

  factory Queries.fromJson(Map<String, dynamic> json) => Queries(
    log: List<dynamic>.from(json["log"].map((x) => x)),
    time: json["time"],
    duplicates: json["duplicates"],
  );

  Map<String, dynamic> toJson() => {
    "log": List<dynamic>.from(log!.map((x) => x)),
    "time": time,
    "duplicates": duplicates,
  };
}
