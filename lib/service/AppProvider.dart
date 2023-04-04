import 'dart:io';

import 'package:flutter/material.dart';
import '../model/User.dart';
import 'Dio.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  bool isLoggin = false;
  bool ChLoggined = true;
  late String messages_check_login;
  late String loginMessage;

  late User user_login;

  // ກຳນົດໜ້າ listcontact ແລະ Form
  int AdminPage = 0;
  void SetAdminPage(int index) {
    AdminPage = index;
    notifyListeners();
  }

  List<User> ListUser = [];
  List<User> ListUserSearch = [];

  void AddListUser(User _user) {
    ListUser.add(_user);
    // print(_user);
    notifyListeners();
  }

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
      //print(Response.data);

      Map<String, dynamic> decode = Response.data;
      // print(decode['user']);
      this.user_login = User.fromJson(decode['user']);

      print(user_login.user_type);

      //ດຶງຂໍ້ມູນ
      GetAllUser();
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
      File? imageFile) async {
    // ບໍ່ມີຮູບສົ່ງມາ
    if (imageFile == null) {
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

      final response = await dio().post('/register',
          data: DataAddUser,
          options: Options(validateStatus: ((status) => true)));

      print(response.data);

      if (response.statusCode == 200) {
        if (response.data['success']) {
          loginMessage = response.data['message'];
          AdminPage = 0;
          notifyListeners();
          return true;
        } else {
          loginMessage = response.data['message'];
          notifyListeners();
          return false;
        }
      }
    } else {
      // ມີຮູບພາບສົ່ງມານຳ

      String filename = imageFile.path.split('/').last;

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
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: filename,
        )
      });

      final response = await dio().post('/register',
          data: DataAddUser,
          options: Options(validateStatus: ((status) => true)));

      print(response.data);

      if (response.statusCode == 200) {
        if (response.data['success']) {
          loginMessage = response.data['message'];
          AdminPage = 0;
          notifyListeners();
          return true;
        } else {
          loginMessage = response.data['message'];
          notifyListeners();
          return false;
        }
      }
    }

    // final prefs = await SharedPreferences.getInstance();
    // String? token = await prefs.getString('token');
    // var Token1 = token!.replaceAll('\n', '');
    // var NewToken = Token1.replaceAll('\r', '');

    // final response = await dio().post('/register',
    //     data: DataAddUser,
    //     options: Options(headers: {
    //       "Content-Type": "application/json; charset=utf-8",
    //       "Authorization": "Bearer $NewToken",
    //     }, validateStatus: ((status) => true)));

    // print(response.data);

    return false;
  }

  Future<bool> UpdateUserEdit(
    int UserID,
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
    File? imageFile,
  ) async {
    // ອັບເດດຂໍ້ມູນ ບໍ່ມີຮູບພາບສົ່ງມາ
    if (imageFile == null) {
      FormData DataUpdateUser = FormData.fromMap({
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

      final response = await dio().post('/update_user/${UserID}',
          data: DataUpdateUser,
          options: Options(headers: {
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": "Bearer $NewToken",
          }, validateStatus: ((status) => true)));
      // ອັບເດດຂໍ້ມູນ ຜູ້ໃຊ້ Login
      CheckLoggin(token: token);

      if (response.statusCode == 200) {
        SetAdminPage(0);
        GetAllUser();
        notifyListeners();
        return true;
      }
    } else {
      /// ອັບເດດຂໍ້ມູນ ພ້ອມຮູບພາບ

      String filename = imageFile.path.split('/').last;

      FormData DataUpdateUser = FormData.fromMap({
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
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: filename,
        )
      });

      final prefs = await SharedPreferences.getInstance();
      String? token = await prefs.getString('token');
      var Token1 = token!.replaceAll('\n', '');
      var NewToken = Token1.replaceAll('\r', '');

      final response = await dio().post('/update_user/${UserID}',
          data: DataUpdateUser,
          options: Options(headers: {
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": "Bearer $NewToken",
          }, validateStatus: ((status) => true)));
      // ອັບເດດຂໍ້ມູນ ຜູ້ໃຊ້ Login
      CheckLoggin(token: token);

      if (response.statusCode == 200) {
        SetAdminPage(0);
        GetAllUser();
        notifyListeners();
        return true;
      }
    }

    return false;
  }

  Future<bool> RemoveUser(int UserID) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    var Token1 = token!.replaceAll('\n', '');
    var NewToken = Token1.replaceAll('\r', '');

    final response = await dio().delete('/delete_user/${UserID}',
        options: Options(headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $NewToken",
        }, validateStatus: ((status) => true)));

    print(response.data);

    if (response.statusCode == 200) {
      SetAdminPage(0);
      GetAllUser();
      notifyListeners();
      return true;
    }
    return false;
  }

  void GetAllUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    var Token1 = token!.replaceAll('\n', '');
    var NewToken = Token1.replaceAll('\r', '');

    final response = await dio().get('/get_all_user',
        options: Options(headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $NewToken",
        }, validateStatus: ((status) => true)));

    // print(response.data);
    if (response.statusCode == 200) {
      ListUser = [];
      Map<String, dynamic> dcode = response.data;
      for (var item in dcode['user']) {
        User _listUser = User(
            id: item['id'],
            name: item['name'].toString(),
            last_name: item['last_name'].toString(),
            gender: item['gender'].toString(),
            image: item['image'].toString(),
            tel: item['tel'].toString(),
            password: '',
            birth_day: item['birth_day'].toString(),
            add_village: item['add_village'].toString(),
            add_city: item['add_city'].toString(),
            add_province: item['add_province'].toString(),
            add_detail: item['add_detail'].toString(),
            email: item['email'].toString(),
            web: item['web'].toString(),
            job: item['job'].toString(),
            job_type: item['job_type'].toString(),
            user_type: item['user_type'].toString());
        AddListUser(_listUser);
      }

      ListUserSearch = await ListUser;

      /// ສະແດງໜ້າ ຂໍ້ມູນ
      isLoggin = true;
      ChLoggined = true;
      notifyListeners();
    }
  }

  void SearchContact(String value) {
    List<User> Search = [];
    if (value.isNotEmpty) {
      final Sc = ListUser.where((item) {
        final name = item.name.toLowerCase();
        final input = value.toLowerCase();
        return name.contains(input);
      }).toList();
      ListUserSearch = Sc;
      notifyListeners();
    } else {
      ListUserSearch = ListUser;
      notifyListeners();
    }
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
      GetAllUser();
      CheckLoggin(token: token);
      // ກຳນົດໃຫ້ເຂົ້າສູ່ລະບົບ
      // isLoggin = true;
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
