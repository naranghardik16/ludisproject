import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Help/AboutLudis.dart';
import 'package:flutter_firebase_login/Screens/Help/ContactSupport.dart';

class HelpScreen extends StatefulWidget {
  static String routeName = "/settings";

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20.0),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("About Ludis", style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AboutLudis()));
                          //open about Ludis
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        title: Text("FAQS", style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open FAQS
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        title: Text("Contact Support", style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ContactSupport()));
                          //open Contact Support
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        title: Text("Privacy Policy", style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open Privacy Policy
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        title: Text("Terms of Service", style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open Terms of Service
                        },
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 20.0),
                // Text(
                //   "Notification Settings",
                //   style: TextStyle(
                //     fontSize: 20.0,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black,
                //   ),
                // ),
                // const SizedBox(height: 20.0),
                // Card(
                //   elevation: 4.0,
                //   margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10.0)
                //   ),
                //   child: Column(
                //     children: <Widget>[
                //       SwitchListTile(
                //         activeColor: Colors.blue,
                //         contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                //         value: true,
                //         title: Text("Receive Notifications"),
                //         onChanged: (val) {},
                //       ),
                //       _buildDivider(),
                //       SwitchListTile(
                //         activeColor: Colors.blue,
                //         contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                //         value: false,
                //         title: Text("Receive Newsletter"),
                //         onChanged: null,
                //       ),
                //       _buildDivider(),
                //       SwitchListTile(
                //         activeColor: Colors.blue,
                //         contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                //         value: true,
                //         title: Text("Receive Offers"),
                //         onChanged: (val) {},
                //       ),
                //       _buildDivider(),
                //       SwitchListTile(
                //         activeColor: Colors.blue,
                //         contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                //         value: false,
                //         title: Text("Receive App Updates"),
                //         onChanged: null,
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 60.0),
              ],
            ),
          ),
        ],
      ),
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