import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserRepo {
  static Future<UserModel?> userData() async {
    http.Response response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=2'),
    );
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
