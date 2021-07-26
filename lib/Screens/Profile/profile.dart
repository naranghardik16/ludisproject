// @dart=2.9
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_login/Screens/DisplayProfile/DisplayProfile.dart';
import 'package:flutter_firebase_login/Screens/Help/Help.dart';
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
              key: new Key("Log Out Button"),
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
              key: new Key("Cancel Button"),
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

class Profile extends StatefulWidget {
  static String routeName = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  TextEditingController _emailController = TextEditingController();

  void showAlertDialog(BuildContext context) {
    final mq = MediaQuery.of(context);
    final emailField = TextFormField(
      key: new Key("EmailField"),
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "example@domain.com",
        labelText: "Email",
        prefixIcon: Icon(Icons.mail),
        filled: true,
        fillColor: Color.fromRGBO(223, 248, 250, 1),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      validator: (value) {
        if (value.trim().isEmpty) {
          return 'Please enter your Email Address';
        }
        // Check if the entered email has the right format
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return 'Please enter a valid Email Address';
        }
        // Return null if the entered email is valid
        return null;
      },
    );

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
                Text(
                  "Insert Reset Email:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                emailField,
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 15,left: 15,right: 15),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color.fromRGBO(237, 148, 99, 1),
                    // color: Color(0xff8c52ff),
                    child: MaterialButton(
                      key: new Key("Send Reset Email"),
                      minWidth: mq.size.width / 2,
                      padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                      child: Text(
                        "Send Reset Email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
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
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(237, 148, 99, 1),
      ),
      backgroundColor: Color.fromRGBO(95, 106, 228, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            IconItemBox(
              key: new Key("Display Profile"),
              text: "Display Profile",
              icon: "assets/images/user.png",
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DisplayProfile())
                );
              },
            ),
            IconItemBox(
              key: new Key("Change Password"),
              text: "Change Password",
              icon: "assets/images/settings.png",
              press: () {
                showAlertDialog(context);
              },
            ),
            IconItemBox(
              key: new Key("Help Center"),
              text: "Help Center",
              icon: "assets/images/question.png",
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Help())
                );
              },
            ),
            IconItemBox(
              key: new Key("Log Out"),
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

