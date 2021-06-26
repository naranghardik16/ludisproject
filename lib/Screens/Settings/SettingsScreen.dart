import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = "/settings";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
                        activeColor: Colors.blue,
                        contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        value: true,
                        title: Text("Receive Notifications", style: TextStyle(fontWeight: FontWeight.bold),),
                        onChanged: (val) {},
                      ),
                      _buildDivider(),
                      SwitchListTile(
                        activeColor: Colors.blue,
                        contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        value: false,
                        title: Text("Receive Newsletter", style: TextStyle(fontWeight: FontWeight.bold),),
                        onChanged: null,
                      ),
                      _buildDivider(),
                      SwitchListTile(
                        activeColor: Colors.blue,
                        contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        value: true,
                        title: Text("Receive Offers", style: TextStyle(fontWeight: FontWeight.bold),),
                        onChanged: (val) {},
                      ),
                      _buildDivider(),
                      SwitchListTile(
                        activeColor: Colors.blue,
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
