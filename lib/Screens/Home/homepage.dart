import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/BookingScreen/booking_screen.dart';
import 'package:flutter_firebase_login/Screens/Profile/profile_screen.dart';
import 'package:flutter_firebase_login/Screens/UserHistory/user_history_screen.dart';

class Homepage extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  int _index = 0;
  List _pages = [FacilityBookingScreen(), UserHistory(), Profile()];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
        elevation: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(240, 240, 240, 1),
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            label: "Booking",
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.blue,
            backgroundColor: Color.fromRGBO(240, 240, 240, 1),
            icon: Icon(
              Icons.history_outlined,
              color: Colors.black,
            ),
            label: "History",
            activeIcon: Icon(
              Icons.history,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(240, 240, 240, 1),
            // backgroundColor: Colors.blue,
            icon: Icon(
              Icons.verified_user,
              color: Colors.black,
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