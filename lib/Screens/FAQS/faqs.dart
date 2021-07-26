import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/components/item_box.dart';

class Faqs extends StatefulWidget {

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
                  key: new Key("FAQ Short Item 1"),
                  text: "How Many Days In Advance Can You Book The Facilities?",
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
                    key: new Key("FAQ Expanded Item 1"),
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
                            Expanded(child: Text("How Many Days In Advance Can You \nBook The Facilities?", key: new Key("FAQ 1 QS Text"), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15), textAlign: TextAlign.center,)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("One Can Book the facility a week in advance", key: new Key("FAQ 1 ANS Text"), style: TextStyle(fontSize: 15, color: Colors.lightBlue), textAlign: TextAlign.center,)),
                          ],
                        ),
                      ]
                    ),
                  ),
                ),
              if(state != 2)
                ItemBox(
                  key: new Key("FAQ Short Item 2"),
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
                    key: new Key("FAQ Expanded Item 2"),
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
                              Expanded(child: Text("What Time Are The Facilities Open?", key: new Key("FAQ 2 QS Text"), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15), textAlign: TextAlign.center,)),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: Text("Facility Opening Time Differs from Hall to Hall however most Facilities Open at 8:00 AM and Close at 10:00 PM", key: new Key("FAQ 2 ANS Text"), style: TextStyle(fontSize: 15, color: Colors.lightBlue), textAlign: TextAlign.center,)),
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
