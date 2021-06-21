import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_login/Screens/Dashboard/dashboard.dart';
import 'package:flutter_firebase_login/Screens/FacilitiesDirectory/facilities_directory.dart';
import 'package:flutter_firebase_login/Screens/profile/profile_screen.dart';
import 'package:flutter_firebase_login/Screens/Review/review.dart';

import 'components/body.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.orangeAccent,
      body: Body(),
    );
  }
}

