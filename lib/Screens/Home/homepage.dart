// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Bookings/booking_screen.dart';
import 'package:flutter_firebase_login/Screens/Profile/profile.dart';

class Homepage extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  int _index = 0;
  List _pages = [Bookings(), Profile()];

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orangeAccent,
      backgroundColor: Color.fromRGBO(95, 106, 228, 1),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        // backgroundColor: Colors.blue,
        backgroundColor: Color.fromRGBO(237, 148, 99, 1),
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.blue,
            backgroundColor: Color.fromRGBO(237, 148, 99, 1),
            icon: Icon(
              Icons.book,
              color: Colors.white,
            ),
            label: "Bookings",
            activeIcon: Icon(
              Icons.book,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(237, 148, 99, 1),
            // backgroundColor: Colors.blue,
            icon: Icon(
              Icons.verified_user,
              color: Colors.white,
            ),
            label: "Profile",
            activeIcon: Icon(
              Icons.verified_user,
              color: Colors.black,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}