class UserModel {
  bool success;
  int statusCode;
  String code;
  String message;
  UserData data;

  UserModel({
    required this.success,
    required this.statusCode,
    required this.code,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      success: json['success'],
      statusCode: json['statusCode'],
      code: json['code'],
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  String token;
  int id;
  String email;
  String nicename;
  String firstName;
  String lastName;
  String displayName;

  UserData({
    required this.token,
    required this.id,
    required this.email,
    required this.nicename,
    required this.firstName,
    required this.lastName,
    required this.displayName,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      token: json['token'],
      id: json['id'],
      email: json['email'],
      nicename: json['nicename'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      displayName: json['displayName'],
    );
  }
}
