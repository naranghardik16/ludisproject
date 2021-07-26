//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/cloud_firestore/user_ref.dart';
import 'package:flutter_firebase_login/components/item_box.dart';
import 'package:flutter_firebase_login/model/user_model.dart';

class DisplayProfile extends StatefulWidget {
  @override
  _DisplayProfileState createState() => _DisplayProfileState();
}

class _DisplayProfileState extends State<DisplayProfile> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nusnetIdController = TextEditingController();

  List userProfilesList = [];
  String userID = "";

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
    fetchDatabaseList();
  }

  fetchUserInfo() async {
    User getUser = FirebaseAuth.instance.currentUser;
    userID = getUser.uid;
  }

  fetchDatabaseList() async {
    dynamic resultant = await getUsersList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }

  updateData(String userName, String email, String nusnetId, String userID) async {
    await updateUserList(userName, email, nusnetId, userID);
    fetchDatabaseList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(95, 106, 228, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(237, 148, 99, 1),
          automaticallyImplyLeading: true,
          title: Text("Profile Details"),
        ),
        body: Center(
            child: FutureBuilder(
                future: getUserProfiles(context,
                    FirebaseAuth.instance.currentUser.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    var userModel = snapshot.data as UserModel;
                    return SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          ItemBox(text: "Email: ${userModel.email}", press: null),
                          ItemBox(text: "Username: ${userModel.userName}", press: null),
                          ItemBox(text: "NUSNET ID: ${userModel.nusnetId}", press: null),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                openDialogueBox(context);
                              },
                              child: Text("Edit Profile"),
                              style: ElevatedButton.styleFrom(primary: Color.fromRGBO(237, 148, 99, 1)),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                }
            )
        )
    );
  }

  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit User Details'),
            content: Container(
              height: 250,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: _userNameController,
                      decoration: InputDecoration(hintText: 'Username'),
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                    TextField(
                      controller: _nusnetIdController,
                      decoration: InputDecoration(hintText: 'NUSNET ID'),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  submitAction(context);
                  // setState(() {
                  //
                  // });
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        }
    );
  }

  submitAction(BuildContext context) {
    updateData(_userNameController.text, _emailController.text, _nusnetIdController.text, userID);
    _userNameController.clear();
    _emailController.clear();
    _nusnetIdController.clear();
  }
}