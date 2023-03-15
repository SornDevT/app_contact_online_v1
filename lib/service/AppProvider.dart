import 'package:flutter/material.dart';
import '../model/User.dart';
import 'Dio.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  bool isLoggin = false;
  bool ChLoggined = true;
  late String messages_check_login;

  void CheckLoggin({required String token}) async {
    ChLoggined = false;
    notifyListeners();

    print(token);

    var Token1 = token.replaceAll('\n', '');
    var NewToken = Token1.replaceAll('\r', '');

    final Response = await dio().get('/check_user',
        options: Options(headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $NewToken",
        }, validateStatus: ((status) => true)));

    if (Response.statusCode == 200) {
      isLoggin = true;
      ChLoggined = true;
      notifyListeners();
    } else {
      isLoggin = false;
      ChLoggined = true;
      notifyListeners();
    }
  }

  Future<bool> AddUser(
    String name,
    String last_name,
    String gender,
    String tel,
    String password,
    String birth_day,
    String add_village,
    String add_city,
    String add_province,
    String add_detail,
    String email,
    String web,
    String job,
    String job_type,
  ) async {
    FormData DataAddUser = FormData.fromMap({
      'name': name,
      'last_name': last_name,
      'gender': gender,
      'tel': tel,
      'password': password,
      'birth_day': birth_day,
      'add_village': add_village,
      'add_city': add_city,
      'add_province': add_province,
      'add_detail': add_detail,
      'email': email,
      'web': web,
      'job': job,
      'job_type': job_type,
    });

    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    var Token1 = token!.replaceAll('\n', '');
    var NewToken = Token1.replaceAll('\r', '');

    final response = await dio().post('/register',
        options: Options(headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $NewToken",
        }, validateStatus: ((status) => true)));

    print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<bool> LoginAuth(Tel, Password) async {
    Map creds = {
      'tel': Tel,
      'password': Password,
      'device_name': 'no',
    };

    print('send code');

    final response = await dio().post('/login',
        data: creds, options: Options(validateStatus: ((status) => true)));

    print(response.statusCode);
    // print(response.data);

    if (response.statusCode == 200) {
      String token = response.data.toString();
      await saveToken(token);

      // ກຳນົດໃຫ້ເຂົ້າສູ່ລະບົບ
      isLoggin = true;
      notifyListeners();
      return true;
    }

    if (response.statusCode == 422 || response.statusCode == 302) {
      messages_check_login = 'ເບີໂທ ຫຼື ລະຫັດຜ່ານບໍ່ຖຶກຕ້ອງ!!';
      notifyListeners();
      return false;
    }

    return false;
  }

  Future<bool> LogOut() async {
    ChLoggined = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    var Token1 = token!.replaceAll('\n', '');
    var NewToken = Token1.replaceAll('\r', '');

    final response = await dio().get('/logout',
        options: Options(headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $NewToken",
        }, validateStatus: ((status) => true)));

    print(response.statusCode);

    if (response.statusCode == 200) {
      cleanUp();
      return true;
    }

    return false;
  }

  cleanUp() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggin = false;
    await prefs.remove('token');
    notifyListeners();
  }

  // save token
  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
