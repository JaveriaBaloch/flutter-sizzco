import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizzco/Models/RegisterModel.dart';
import 'package:sizzco/Models/usermodel.dart';

class GetUsers {
  static var client = http.Client();

  Future<bool> login(String username, String password) async {
    Map<String, String> requestHeader = {
      'Content-type': ' application/x-www-form-urlencoded'
    };

    var response = await client.post(
        Uri.parse('https://sizzco.com/wp-json/jwt-auth/v1/token'),
        headers: requestHeader,
        body: {"username": username, "password": password});
    print("username:\t$username\npassword:\t$password");
    print(response.body);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      UserModel userModel = UserModel.fromJson(jsonDecode(jsonString));
      await prefs.setString("email", userModel.data.email);
      await prefs.setString('name', userModel.data.displayName);
      await prefs.setString('id', userModel.data.id.toString());
      String? name = await prefs.getString('email');
      print(name);
      return userModel.statusCode == 200 ? true : false;
    } else {
      return false;
    }
  }

  Future<UserResponseModel> register(
      String username, String email, String password) async {
    Map<String, String> requestHeader = {'Content-type': ' application/json'};

    var response = await client.post(
        Uri.parse('https://sizzco.com/wp-json/wp/v2/users/register'),
        headers: requestHeader,
        body: jsonEncode(
            {"username": username, "email": email, "password": password}));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      await prefs.setString("email", email);
      await prefs.setString('name', username);
    }
    return userResponseModelFromJson(response.body);
  }
}
