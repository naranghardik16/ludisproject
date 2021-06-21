import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_firebase_login/Screens/Settings/SettingsScreen.dart';
import 'package:flutter_firebase_login/Screens/Dashboard/dashboard2.dart';
import 'package:flutter_firebase_login/Screens/help/HelpScreen.dart';
import 'package:flutter_firebase_login/src/Screens/HomeScreen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/images/user.png",
            press: () {},
            // press: () => {
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard())),
            // },
          ),
          ProfileMenu(
            text: "Entry",
            icon: "assets/images/bell.png",
            press: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen())
              );
              // open Notifications Page
            },
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/images/settings.png",
            press: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => SettingsScreen())
              );
            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/images/question.png",
            press: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => HelpScreen())
              );
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/images/power-button-off.png",
            press: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}