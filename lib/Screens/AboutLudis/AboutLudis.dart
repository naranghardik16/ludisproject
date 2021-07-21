import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutLudis extends StatefulWidget {
  const AboutLudis({Key? key}) : super(key: key);

  @override
  _AboutLudisState createState() => _AboutLudisState();
}

class _AboutLudisState extends State<AboutLudis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(95, 106, 228, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 148, 99, 1),
        centerTitle: true,
        title: Text(
          "About Ludis",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8)
          ),
          child: SingleChildScrollView(
            child: Text(
              "After having lived in NUS for over a semester, as students we believe that there is a need for a centralized booking system to streamline and improve the booking process. There are a multitude of problems associated with booking these facilities and there is a need for some change. As of today, students at Prince George’s Park find it inconvenient to book facilities such as meeting rooms, seminar rooms and multipurpose sports hall, as one has to book at least 3 days in advance over email. Moreover, despite the availability of the facilities, students are often unable to use these facilities due to the delay in processing the booking requests. Furthermore, time conflict resolution is also another pressing concern as time conflicts cannot be indicated till the processing of the request.",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black
              ),
            ),
          ),
        ),
      ),
    );
  }
}
