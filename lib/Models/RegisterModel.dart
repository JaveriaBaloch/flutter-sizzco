import 'dart:convert';

class UserRegister {
  String? userName;
  String? email;
  String? password;
  String? confirmPassword;

  UserRegister({
    this.userName,
    this.email,
    this.password,
    this.confirmPassword,
  });

  UserRegister.fromJson(Map<String, dynamic> json) {
    userName = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;

    return data;
  }
}

class UserResponseModel {
  int? code;
  String? message;

  UserResponseModel({this.code, this.message});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

UserResponseModel userResponseModelFromJson(String str) =>
    UserResponseModel.fromJson(json.decode(str));
