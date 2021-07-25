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
        backgroundColor: Color.fromRGBO(202, 246, 251, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(223, 228, 254, 1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            "Help Center",
            style: TextStyle(color: Colors.black),
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
}