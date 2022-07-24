// To parse this JSON data, do
//
//     final postUserResModel = postUserResModelFromJson(jsonString);

import 'dart:convert';

PostUserResModel postUserResModelFromJson(String str) =>
    PostUserResModel.fromJson(json.decode(str));

String postUserResModelToJson(PostUserResModel data) =>
    json.encode(data.toJson());

class PostUserResModel {
  PostUserResModel({
    this.status,
    this.message,
    this.id,
    this.username,
  });

  bool? status;
  String? message;
  String? id;
  String? username;

  factory PostUserResModel.fromJson(Map<String, dynamic> json) =>
      PostUserResModel(
        status: json["status"],
        message: json["message"],
        id: json["id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "id": id,
        "username": username,
      };
}
