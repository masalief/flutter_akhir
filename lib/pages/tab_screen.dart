import 'package:alief_flutter/pages/account_page.dart';
import 'package:alief_flutter/pages/history_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'history_page.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  List<Widget> _selectedBody = [
    HomePage(),
    HistoryPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 12, 11),
      body: _selectedBody[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 3, 12, 11),
        selectedItemColor: Color.fromARGB(255, 163, 171, 130),
        unselectedItemColor: Color.fromARGB(255, 163, 171, 130),
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cottage_rounded,
              color: Color.fromARGB(255, 163, 171, 130),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment_outlined,
              color: Color.fromARGB(255, 163, 171, 130),
            ),
            label: 'Catatan Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 163, 171, 130),
            ),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
