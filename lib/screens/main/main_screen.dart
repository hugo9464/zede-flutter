import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zede_app/screens/history_screen.dart';
import 'package:zede_app/screens/login_page.dart';
import 'package:zede_app/screens/profile_page.dart';
import 'package:zede_app/screens/weighing_screen.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({required this.user});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  late User _currentUser; 

  late List<Widget> pageList;

  @override
  void initState() {
    _currentUser = widget.user;
    pageList = <Widget>[
      WeighingScreen(),
      HistoryPage(),
      ProfilePage(user: _currentUser),

  ];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });;
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: "Pesée"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Historique"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Défi"),
        ],
      ),
    );
  }
}