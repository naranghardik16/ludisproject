import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/BookingPage/bookingpage.dart';
import 'package:flutter_firebase_login/Screens/BookingSecondAttempt/booking_screen.dart';
import 'package:flutter_firebase_login/src/Screens/BookingScreen.dart';
import 'package:flutter_firebase_login/Screens/Dashboard/dashboard.dart';
import 'package:flutter_firebase_login/Screens/FacilitiesDirectory/facilities_directory.dart';
import 'package:flutter_firebase_login/Screens/profile/profile_screen.dart';
import 'package:flutter_firebase_login/src/Screens/review.dart';
import 'package:flutter_firebase_login/Screens/Review/ReviewBookingsScreen.dart';

class Homepage extends StatefulWidget {
  static String routeName = "/home";

  // const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  int _index = 0;
  List _pages = [FacilityBookingScreen(), BookingPage(), ReviewBookingsScreen(), FacilitiesDirectory(),ProfileScreen()];

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
              Icons.dashboard,
              color: Colors.white,
            ),
            label: "TempBooking",
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
          ),
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
            backgroundColor: Color.fromRGBO(237, 148, 99, 1),
            // backgroundColor: Colors.blue,
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