import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'service/AppProvider.dart';

import 'Pages/AdminHome.dart';
import 'Pages/LodingPage.dart';
import 'Pages/Login.dart';
import 'Pages/MainApp.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AppProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );

  //  MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_) => Counter()),
  //     ],
  //     child: const MyApp(),
  //   ),
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Contact Online',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LogInPage(),
    );
  }
}
