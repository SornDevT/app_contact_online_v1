import 'package:flutter/material.dart';
import '../model/User.dart';
import 'Dio.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  Future<bool> LoginAuth(Tel, Password) async {
    Map creds = {
      'tel': Tel,
      'password': Password,
      'device_name': 'no',
    };

    print('send code');

    final response = await dio().post('/login',
        data: creds, options: Options(validateStatus: ((status) => true)));

    // print(response.statusCode);
    print(response.data);

    if (response.statusCode == 200) {
      String token = response.data.toString();

      await saveToken(token);

      return true;
    }

    return false;
  }

  // save token
  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
