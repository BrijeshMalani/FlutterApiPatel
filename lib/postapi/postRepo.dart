import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapipatel/postapi/responsemodel.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  static Future postRepo({required Map<String, dynamic> reqBody}) async {
    http.Response response = await http.post(
      Uri.parse('https://codelineinfotech.com/student_api/User/signup.php'),
      body: reqBody,
    );
    if (response.statusCode == 200) {
      print('${postUserResModelFromJson(response.body)}');
      var result = jsonDecode(response.body);
      return result; //postUserResModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
