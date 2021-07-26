import 'package:flutter/material.dart';
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
        backgroundColor: Color.fromRGBO(202, 246, 251, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(223, 228, 254, 1),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "FAQS",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              if (state != 1)
                ItemBox(
                  text: "How Many Days In Advance Can You Book?",
                  press: () {
                    setState(() {
                      state = 1;
                    });
                  },
                ),
              if (state == 1)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        primary: Colors.black,
                        // backgroundColor: Color.fromRGBO(254, 241, 170, 1),
                        backgroundColor: Color.fromRGBO(253, 204, 213, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.black),
                        )),
                    onPressed: () {
                      setState(() {
                        state = 0;
                      });
                    },
                    child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                "How Many Days In Advance Can You Book?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                "One Can Book the facility a week in advance",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ]),
                  ),
                ),
              if (state != 2)
                ItemBox(
                  text: "What Time Are The Facilities Open?",
                  press: () {
                    setState(() {
                      state = 2;
                    });
                  },
                ),
              if (state == 2)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        primary: Colors.black,
                        backgroundColor: Color.fromRGBO(253, 204, 213, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.black),
                        )),
                    onPressed: () {
                      setState(() {
                        state = 0;
                      });
                    },
                    child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                "What Time Are The Facilities Open?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                "Facility Opening Time Differs from Hall to Hall however most Facilities Open at 8:00 AM and Close at 10:00 PM",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ]),
                  ),
                ),
            ],
          ),
        ));
  }


}