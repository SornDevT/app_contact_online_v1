import 'package:app_contacts_online/service/AppProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ListContact.dart';
import 'FormAdd.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  static const List<Widget> _widgetOption = <Widget>[ListContact(), FormAdd()];

  // int Index = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, Auth, child) {
      return Scaffold(
        body: SafeArea(
          child: _widgetOption[Auth.AdminPage],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            _onItemTap(value);
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
          currentIndex: Auth.AdminPage,
          selectedItemColor: Colors.white,
        ),
      );
    });
  }

  void _onItemTap(int index) {
    Provider.of<AppProvider>(context, listen: false).SetAdminPage(index);
  }
}
