import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/AboutLudis/AboutLudis.dart';
import 'package:flutter_firebase_login/Screens/ContactSupport/ContactSupport.dart';
import 'package:flutter_firebase_login/components/icon_item_box.dart';
import 'package:flutter_firebase_login/components/item_box.dart';

class Faqs extends StatefulWidget {
  //static String routeName = "/settings";

  @override
  _FaqsState createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  late int state = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(95, 106, 228, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(237, 148, 99, 1),
          centerTitle: true,
          title: Text(
            "FAQS",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              if(state != 1)
                ItemBox(
                  text: "How Many Days In Advance Can You Book?",
                  press: () {
                    setState(() {
                      state = 1;
                    });
                  },
                ),
              if(state == 1)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.black),
                        )
                    ),
                    onPressed: () {
                      setState(() {
                        state = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text("How Many Days In Advance Can You Book?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15), textAlign: TextAlign.center,)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("One Can Book the facility a week in advance", style: TextStyle(fontSize: 15, color: Colors.lightBlue), textAlign: TextAlign.center,)),
                          ],
                        ),
                      ]
                    ),
                  ),
                ),
              if(state != 2)
                ItemBox(
                  text: "What Time Are The Facilities Open",
                  press: () {
                    setState(() {
                      state = 2;
                    });
                  },
                ),
              if(state == 2)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.black),
                        )
                    ),
                    onPressed: () {
                      setState(() {
                        state = 0;
                      });
                    },
                    child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text("What Time Are The Facilities Open?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15), textAlign: TextAlign.center,)),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: Text("Facility Opening Time Differs from Hall to Hall however most Facilities Open at 8:00 AM and Close at 10:00 PM", style: TextStyle(fontSize: 15, color: Colors.lightBlue), textAlign: TextAlign.center,)),
                            ],
                          ),
                        ]
                    ),
                  ),
                ),
            ],
          ),
        )
    );
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
