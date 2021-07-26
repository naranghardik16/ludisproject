import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({Key? key}) : super(key: key);

  @override
  _ContactSupportState createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(95, 106, 228, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 148, 99, 1),
        centerTitle: true,
        title: Text(
          "Contact Support",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 120, bottom: 120, left: 20, right: 20),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Customer Service Enquiries\n", key: new Key("Customer Service Enquiries"), textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.black)),
                Text("Questions about how we work?\n\nEnquiries regarding your booking? \n\nWe're here to help!\n", key: new Key("Details"), textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.black)),
                Text("Contact Us On:\n\ntrailblazer@nusu.onmicrosoft.com\n or\n+65 83087184", key: new Key("Contact Details"), textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
