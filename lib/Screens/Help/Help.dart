import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/AboutLudis/AboutLudis.dart';
import 'package:flutter_firebase_login/Screens/ContactSupport/ContactSupport.dart';
import 'package:flutter_firebase_login/Screens/FAQS/faqs.dart';
import 'package:flutter_firebase_login/components/icon_item_box.dart';

class Help extends StatefulWidget {
  //static String routeName = "/settings";

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(95, 106, 228, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(237, 148, 99, 1),
          centerTitle: true,
          title: Text(
            "Help Center",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              IconItemBox(
                text: "About Ludis",
                icon: "assets/images/user.png",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutLudis()));
                },
              ),
              IconItemBox(
                text: "FAQS",
                icon: "assets/images/settings.png",
                press: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Faqs()));
                },
              ),
              IconItemBox(
                text: "Contact Support",
                icon: "assets/images/question.png",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactSupport()));
                },
              ),
            ],
          ),
        ));
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
