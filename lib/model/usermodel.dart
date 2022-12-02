// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

List<Usermodel> usermodelFromJson(String str) =>
    List<Usermodel>.from(json.decode(str).map((x) => Usermodel.fromJson(x)));

String usermodelToJson(List<Usermodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usermodel {
  Usermodel({
    this.userId,
    this.username,
    this.firstname,
    this.lastname,
    this.password,
    this.email,
    this.profilePicture,
  });

  String? userId;
  String? username;
  String? firstname;
  String? lastname;
  String? password;
  String? email;
  String? profilePicture;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        userId: json["user_id"],
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        password: json["password"],
        email: json["email"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
        "password": password,
        "email": email,
        "profile_picture": profilePicture,
      };
}
