import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_login/Screens/dashboard.dart';
import 'package:flutter_firebase_login/Screens/facilities_directory.dart';
import 'package:flutter_firebase_login/Screens/profile/profile_screen.dart';
import 'package:flutter_firebase_login/Screens/review.dart';

class Dashboard2 extends StatefulWidget {
  @override
  _Dashboard2State createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)
                    )
                )
            ),
            onPressed: () {
              // Navigator.pop(context);
            },
            child: Text("Profile"),
          )
        // child: Text("Profile"),
      ),
    );
  }
}