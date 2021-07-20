// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_firebase_login/Screens/EditProfile/EditProfileScreen.dart';
import 'package:flutter_firebase_login/cloud_firestore/user_ref.dart';
import 'package:flutter_firebase_login/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MyAccountScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(223, 228, 254, 1),
            title: Text("My Account", style: TextStyle(color: Colors.black),),
            centerTitle: true,
          ),
          resizeToAvoidBottomInset: true,
          backgroundColor: Color.fromRGBO(202, 246, 251, 1),
          body: SingleChildScrollView(
            child: Column(
              children: [
                //User Profile
                FutureBuilder(
                    future: getUserProfiles(context,
                        FirebaseAuth.instance.currentUser.uid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        var userModel = snapshot.data as UserModel;
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 50, 50, 8),
                              child: Text(
                                "Email: ${userModel.email}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 8, 50, 8),
                              child: Text(
                                "Username: ${userModel.userName}",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 8, 50, 8),
                              child: Text(
                                "NUSNET ID: ${userModel.nusnetId}",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => EditProfileScreen())
                                  );
                                },
                                child: Text("Edit Profile", style: TextStyle(color: Colors.black),),
                                style: ElevatedButton.styleFrom(primary: Color.fromRGBO(
                                    254, 241, 170, 1)),

                              ),
                            )
                          ],
                        );
                        return Container(
                          decoration: BoxDecoration(color: Color(0xFF383838)),
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                maxRadius: 30,
                                backgroundColor: Colors.black,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${userModel.email}',
                                  ),
                                  Text(
                                    '${userModel.nusnetId}',
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }
                    })
              ],
            ),
          ),
        ));
  }
}

//
// class MyAccountScreen extends StatelessWidget {
//   String myEmail;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//           children: <Widget>[
//       FutureBuilder(
//       future: _fetch(),
//       builder: builder,
//     );
//
//     ],
//     )
//     ,
//     );
//   }
//
//   _fetch() async {
//     final firebaseUser = await FirebaseAuth.instance.currentUser;
//     if (firebaseUser != null) {
//       await FirebaseFirestore.instance.collection('Users').doc(
//           firebaseUser.uid).get().then((ds){
//         myEmail = ds.data['email'];
//         print(myEmail);
//       });
//     }
//   }
// }
