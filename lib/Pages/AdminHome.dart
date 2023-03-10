import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('data rgeregrrgerg e'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 238, 43, 153),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'ລາຍການສະມາຊິກ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'ລາຍການສະມາຊິກ',
            ),
          ]),
    );
  }
}
