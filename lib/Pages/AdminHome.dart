import 'package:flutter/material.dart';

import 'ListContact.dart';
import 'FormAdd.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  static const List<Widget> _widgetOption = <Widget>[ListContact(), FormAdd()];

  int Index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOption[Index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            Index = value;
          });
        },
        backgroundColor: const Color.fromARGB(255, 238, 43, 153),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ລາຍການສະມາຊິກ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plus_one),
            label: 'ເພີ່ມສະມາຊິກ',
          ),
        ],
        currentIndex: Index,
        selectedItemColor: Colors.white,
      ),
    );
  }
}
