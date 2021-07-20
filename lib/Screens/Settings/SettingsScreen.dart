import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/widgets/custom_alert_dialog.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = "/settings";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void showAlertDialog(BuildContext context) {
    final mq = MediaQuery.of(context);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController _emailControllerField =
          TextEditingController();
          return CustomAlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 4.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Text("Insert Reset Email:"),
                  TextField(
                    controller: _emailControllerField,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "something@example.com",
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color.fromRGBO(237, 148, 99, 1),
                      // color: Color(0xff8c52ff),
                      child: MaterialButton(
                        minWidth: mq.size.width / 2,
                        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                        child: Text(
                          "Send Reset Email",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          try {
                            FirebaseAuth.instance.sendPasswordResetEmail(
                                email: _emailControllerField.text);
                            Navigator.of(context).pop();
                          } catch (e) {
                            print(e);
                            // TODO: Add snackbar reporting error
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(95, 106, 228, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 148, 99, 1),
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.white,
        //   ),
        // ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Card(
                //   elevation: 8.0,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10.0)
                //   ),
                //   color: Colors.white,
                //   child: ListTile(
                //     onTap: () {
                //       //open edit profile
                //     },
                //     title: Text(
                //       "Siddharth Srivastava",
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //     leading: CircleAvatar(
                //       backgroundImage: AssetImage("assets/images/profile_image.jpeg"),
                //     ),
                //     trailing: Icon(
                //       Icons.edit,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
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
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                        title: Text("Change Password", style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          showAlertDialog(context);
                          //open change password
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.language,
                          color: Colors.black,
                        ),
                        title: Text("Change Language", style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change language
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        title: Text("Change Location", style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change location
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Notification Settings",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20.0),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Column(
                    children: <Widget>[
                      SwitchListTile(
                        activeColor: Color.fromRGBO(237, 148, 99, 1),
                        contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        value: true,
                        title: Text("Receive Notifications", style: TextStyle(fontWeight: FontWeight.bold),),
                        onChanged: (val) {},
                      ),
                      _buildDivider(),
                      SwitchListTile(
                        activeColor: Color.fromRGBO(237, 148, 99, 1),
                        contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        value: false,
                        title: Text("Receive Newsletter", style: TextStyle(fontWeight: FontWeight.bold),),
                        onChanged: null,
                      ),
                      _buildDivider(),
                      SwitchListTile(
                        activeColor: Color.fromRGBO(237, 148, 99, 1),
                        contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        value: true,
                        title: Text("Receive Offers", style: TextStyle(fontWeight: FontWeight.bold),),
                        onChanged: (val) {},
                      ),
                      _buildDivider(),
                      SwitchListTile(
                        activeColor: Color.fromRGBO(237, 148, 99, 1),
                        contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        value: false,
                        title: Text("Receive App Updates", style: TextStyle(fontWeight: FontWeight.bold),),
                        onChanged: null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60.0),
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
