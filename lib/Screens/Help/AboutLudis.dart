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
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "About Ludis",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 500,
          child: Text("After having lived in NUS for over a semester, "
              "as students we believe that there is a need for a centralized booking system to "
              "streamline and improve the booking process. There are a multitude of problems "
              "associated with booking these facilities and there is a need for some change."
              "As of today, students at Prince George’s Park find it inconvenient to book facilities "
              "such as meeting rooms, seminar rooms and multipurpose sports hall, as one has to book "
              "at least 3 days in advance over email. Moreover, despite the availability of the facilities, "
              "students are often unable to use these facilities due to the delay in processing the booking requests. "
              "Furthermore, time conflict resolution is also another pressing concern as time conflicts cannot be "
              "indicated till the processing of the request. Such problems can be easily solved by an application to book common facilities.",
          style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 25,),
        ),
      ),
    );
  }
}
