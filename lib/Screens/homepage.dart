import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/bookingpage.dart';
import 'package:flutter_firebase_login/Screens/dashboard.dart';
import 'package:flutter_firebase_login/Screens/dashboard2.dart';
import 'package:flutter_firebase_login/Screens/facilities_directory.dart';
import 'package:flutter_firebase_login/Screens/profile/profile_screen.dart';
import 'package:flutter_firebase_login/Screens/review.dart';

class Homepage extends StatefulWidget {
  static String routeName = "/home";

  // const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  int _index = 0;
  List _pages = [Dashboard(), Review(), FacilitiesDirectory(), BookingPage(), ProfileScreen()];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            label: "Dashboard",
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.reviews,
              color: Colors.white,
            ),
            label: "Review",
            activeIcon: Icon(
              Icons.reviews,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.folder,
              color: Colors.white,
            ),
            label: "Facilities",
            activeIcon: Icon(
              Icons.folder,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
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
            backgroundColor: Colors.blue,
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
