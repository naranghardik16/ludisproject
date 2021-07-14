import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_firebase_login/Screens/MyAccount/MyAccountScreen.dart';
import 'package:flutter_firebase_login/Screens/Opening/OpeningScreen.dart';
import 'package:flutter_firebase_login/Screens/Settings/SettingsScreen.dart';
import 'package:flutter_firebase_login/Screens/Dashboard/dashboard2.dart';
import 'package:flutter_firebase_login/Screens/help/HelpScreen.dart';
import 'package:flutter_firebase_login/Screens/Review/ReviewBookingsScreen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:flutter_firebase_login/theme/routes.dart';

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Log out?'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Are you sure you want to log out?'),
              // Text('We hate to see you leave...'),
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: TextButton(
              child: Text('Log out'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color.fromRGBO(237, 148, 99, 1),
                side: BorderSide(color: Colors.black)
              ),
              onPressed: () async {
                print('Confirmed');
                await FirebaseAuth.instance.signOut();
                Navigator.push(context, new MaterialPageRoute(builder: (context) => OpeningView()));
                // Navigator.of(context).pop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            // padding: const EdgeInsets.all(40.0),
            child: TextButton(
              child: Text('Cancel'),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(237, 148, 99, 1),
                  side: BorderSide(color: Colors.black)
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // ProfilePic(),
          // SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/images/user.png",
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyAccountScreen())
              );
            },
            // press: () => {
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard())),
            // },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/images/bell.png",
            press: () {
              // Navigator.push(
              //   context, MaterialPageRoute(builder: (context) => HomeScreen())
              // );
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
            text: "Log out",
            icon: "assets/images/power-button-off.png",
            press: () {
              _showMyDialog(context);

            // press: () async {
            //   await FirebaseAuth.instance.signOut();
            //   Navigator.push(context, new MaterialPageRoute(builder: (context) => OpeningView()));
              // Navigator.pushReplacementNamed(context, AppRoutes.authLogin);
            },
          ),
        ],
      ),
    );
  }
}


