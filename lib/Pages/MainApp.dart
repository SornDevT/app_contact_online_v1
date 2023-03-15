import 'package:flutter/material.dart';
import '../service/AppProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'Login.dart';
import 'AdminHome.dart';
import 'LodingPage.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    CheckLogin();
  }

  void CheckLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');

    // Provider.of<AppProvider>(context, listen: false).GetAllUser();
    Provider.of<AppProvider>(context, listen: false)
        .CheckLoggin(token: token.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppProvider>(
        builder: (context, auth, child) {
          if (auth.ChLoggined) {
            if (auth.isLoggin) {
              return AdminHome();
            } else {
              return LogInPage();
            }
          } else {
            return LoadingPage();
          }
        },
      ),
    );
  }
}
