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
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Text('''
          Customer Service Enquiries
          
          Questions about how we work? Enquiries regarding 
          your booking? We're here to help!
          
          Email us at trailblazer@nusu.onmicrosoft.com or call 
          us on +65 83087184''', maxLines: 10,
          ),
        ),
      ),
      // body: Expanded(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Row(
      //       children: <Widget>[
      //         SizedBox(height: 20),
      //         Expanded(
      //           child: Text(
      //             'Customer Service Enquiries',
      //           ),
      //         ),
      //         SizedBox(height: 20),
      //         Expanded(
      //           child: Text(
      //             "Questions about how we work? Enquiries regarding your booking? We're here to help!",
      //             overflow: TextOverflow.clip,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // // body: Padding(
      // //   padding: const EdgeInsets.all(16.0),
      // //   child: Row(),
      //   // child: Text("Customer Service Enquiries",
      //   //   style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
      // ),
    );
  }
}
