// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_firebase_login/Screens/Dashboard/dashboard.dart';
// import 'package:flutter_firebase_login/Screens/FacilitiesDirectory/facilities_directory.dart';
// import 'package:flutter_firebase_login/Screens/profile/profile_screen.dart';
// import 'package:flutter_firebase_login/src/Screens/review.dart';
//
// import 'components/body.dart';
//
// class ProfileScreen extends StatefulWidget {
//   static String routeName = "/profile";
//
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile", style: TextStyle(color: Colors.black),),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         backgroundColor: Color.fromRGBO(223, 228, 254, 1),
//       ),
//       backgroundColor: Color.fromRGBO(255, 255, 255, 1),
//       body: Body(),
//     );
//   }
// }
// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/EditProfile/DisplayProfile.dart';
import 'package:flutter_firebase_login/Screens/Help/help.dart';
import 'package:flutter_firebase_login/Screens/Opening/OpeningScreen.dart';
import 'package:flutter_firebase_login/components/icon_item_box.dart';
import 'package:flutter_firebase_login/widgets/custom_alert_dialog.dart';

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
                  primary: Colors.black,
                  backgroundColor: Color.fromRGBO(254, 241, 170, 1),
                  side: BorderSide(color: Colors.black)),
              onPressed: () async {
                print('Confirmed');
                await FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => OpeningView()));
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
                  primary: Colors.black,
                  backgroundColor: Color.fromRGBO(254, 241, 170, 1),
                  side: BorderSide(color: Colors.black)),
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

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void showAlertDialog(BuildContext context) {
    final mq = MediaQuery.of(context);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController _emailControllerField = TextEditingController();
          return CustomAlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 4.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Text("Insert Reset Email:"),
                  TextField(
                    controller: _emailControllerField,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "something@example.com",
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color.fromRGBO(254, 241, 170, 1),
                      // color: Color(0xff8c52ff),
                      child: MaterialButton(
                        minWidth: mq.size.width / 2,
                        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                        child: Text(
                          "Send Reset Email",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          try {
                            FirebaseAuth.instance.sendPasswordResetEmail(
                                email: _emailControllerField.text);
                            Navigator.of(context).pop();
                          } catch (e) {
                            print(e);
                            // TODO: Add snackbar reporting error
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(223, 228, 254, 1),
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            IconItemBox(
              text: "Display Profile",
              icon: "assets/images/user.png",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DisplayProfile()));
              },
            ),
            IconItemBox(
              text: "Change Password",
              icon: "assets/images/settings.png",
              press: () {
                showAlertDialog(context);
              },
            ),
            IconItemBox(
              text: "Help Center",
              icon: "assets/images/question.png",
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Help()));
              },
            ),
            IconItemBox(
              text: "Log out",
              icon: "assets/images/power-button-off.png",
              press: () {
                _showMyDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

