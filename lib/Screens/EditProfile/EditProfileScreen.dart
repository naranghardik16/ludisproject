// // @dart=2.9
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_firebase_login/cloud_firestore/user_ref.dart';
// import 'package:flutter_firebase_login/model/user_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
//
// class EditProfileScreen extends StatefulWidget {
//   final String currentUserId;
//
//   EditProfileScreen({this.currentUserId});
//
//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   // final _scaffoldKey = GlobalKey<ScaffoldState>();
//   TextEditingController userNameController = TextEditingController();
//   TextEditingController nusnetIdController = TextEditingController();
//   bool _userNameValid = true;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Column buildUserNameField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(top: 12.0),
//           child: Text(
//             "Username",
//             style: TextStyle(color: Colors.grey),
//           ),
//         ),
//         TextField(
//           controller: userNameController,
//           decoration: InputDecoration(
//             hintText: "Update Username",
//             errorText: _userNameValid ? null : "Username too short",
//           ),
//         )
//       ],
//     );
//   }
//
//   Column buildNusnetIdField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(top: 12.0),
//           child: Text(
//             "NUSNET ID",
//             style: TextStyle(color: Colors.grey),
//           ),
//         ),
//         TextField(
//           controller: nusnetIdController,
//           decoration: InputDecoration(
//             hintText: "Update NUSNET ID",
//           ),
//         )
//       ],
//     );
//   }
//
//   updateProfileData() {
//     setState(() {
//       userNameController.text.trim().length < 4 ||
//           userNameController.text.isEmpty
//           ? _userNameValid = false
//           : _userNameValid = true;
//     });
//
//     if (_userNameValid) {
//       FirebaseFirestore.instance
//           .collection('Users')
//           .doc(widget.currentUserId)
//           .update({
//         "userName": userNameController.text,
//         "nusnetId": nusnetIdController.text
//       });
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Profile Updated!")));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Color.fromRGBO(237, 148, 99, 1),
//             title: Text("Edit Profile"),
//             centerTitle: true,
//           ),
//           resizeToAvoidBottomInset: true,
//           backgroundColor: Color.fromRGBO(95, 106, 228, 1),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 //User Profile
//                 FutureBuilder(
//                     future: getUserProfiles(FirebaseAuth.instance.currentUser.uid),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       } else {
//                         var userModel = snapshot.data as UserModel;
//                         userNameController.text = userModel.userName;
//                         nusnetIdController.text = userModel.nusnetId;
//                         return ListView(
//                           children: <Widget>[
//                             Container(
//                               child: Column(
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: EdgeInsets.all(16.0),
//                                     child: Column(
//                                       children: <Widget>[
//                                         buildUserNameField(),
//                                         buildNusnetIdField(),
//                                       ],
//                                     ),
//                                   ),
//                                   ElevatedButton(
//                                       onPressed: updateProfileData,
//                                       child: Text(
//                                         "Update Profile",
//                                         style: TextStyle(
//                                           color: Colors.red,
//                                           fontSize: 20.0,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ))
//                                 ],
//                               ),
//                             )
//                           ],
//                         );
//                         // return Column(
//                         //   children: <Widget>[
//                         //     Padding(
//                         //       padding: const EdgeInsets.fromLTRB(60, 60, 60, 8),
//                         //       child: Text(
//                         //         "Email: ${userModel.email}",
//                         //         style: TextStyle(
//                         //           fontSize: 20,
//                         //           color: Colors.white,
//                         //         ),
//                         //         textAlign: TextAlign.center,
//                         //       ),
//                         //     ),
//                         //     Padding(
//                         //       padding: const EdgeInsets.fromLTRB(60, 8, 60, 8),
//                         //       child: Text(
//                         //         "Username: ${userModel.userName}",
//                         //         style: TextStyle(fontSize: 20, color: Colors.white),
//                         //       ),
//                         //     ),
//                         //     Padding(
//                         //       padding: const EdgeInsets.fromLTRB(60, 8, 60, 8),
//                         //       child: Text(
//                         //         "NUSNET ID: ${userModel.nusnetId}",
//                         //         style: TextStyle(fontSize: 20, color: Colors.white),
//                         //       ),
//                         //     ),
//                         //   ],
//                         // );
//                         // return Container(
//                         //   decoration: BoxDecoration(color: Color(0xFF383838)),
//                         //   padding: const EdgeInsets.all(16.0),
//                         //   child: Row(
//                         //     children: [
//                         //       CircleAvatar(
//                         //         child: Icon(
//                         //           Icons.person,
//                         //           color: Colors.white,
//                         //           size: 30,
//                         //         ),
//                         //         maxRadius: 30,
//                         //         backgroundColor: Colors.black,
//                         //       ),
//                         //       SizedBox(
//                         //         width: 30,
//                         //       ),
//                         //       Column(
//                         //         children: [
//                         //           Text(
//                         //             '${userModel.email}',
//                         //           ),
//                         //           Text(
//                         //             '${userModel.nusnetId}',
//                         //           ),
//                         //         ],
//                         //       )
//                         //     ],
//                         //   ),
//                         // );
//                       }
//                     })
//               ],
//             ),
//           ),
//         ));
//   }
// }
//
// //
// // class MyAccountScreen extends StatelessWidget {
// //   String myEmail;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SingleChildScrollView(
// //       child: Column(
// //           children: <Widget>[
// //       FutureBuilder(
// //       future: _fetch(),
// //       builder: builder,
// //     );
// //
// //     ],
// //     )
// //     ,
// //     );
// //   }
// //
// //   _fetch() async {
// //     final firebaseUser = await FirebaseAuth.instance.currentUser;
// //     if (firebaseUser != null) {
// //       await FirebaseFirestore.instance.collection('Users').doc(
// //           firebaseUser.uid).get().then((ds){
// //         myEmail = ds.data['email'];
// //         print(myEmail);
// //       });
// //     }
// //   }
// // }

// // @dart=2.9
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_login/model/user_model.dart';
//
// class EditProfile extends StatefulWidget {
//   final String currentUserId;
//
//   EditProfile({this.currentUserId});
//
//   @override
//   _EditProfileState createState() => _EditProfileState();
// }
//
// class _EditProfileState extends State<EditProfile> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   TextEditingController userNameController = TextEditingController();
//   TextEditingController nusnetIdController = TextEditingController();
//   bool isLoading = false;
//   UserModel user;
//   bool _userNameValid = true;
//   bool _nusnetIdValid = true;
//
//   @override
//   void initState() {
//     super.initState();
//     getUser();
//   }
//
//   getUser() async {
//     setState(() {
//       isLoading = true;
//     });
//     DocumentSnapshot doc =  await FirebaseFirestore.instance.collection('Users').doc(widget.currentUserId).get();
//     user = UserModel.fromDocument(doc);
//     userNameController.text = user.userName;
//     nusnetIdController.text = user.nusnetId;
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   Column buildUserNameField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//             padding: EdgeInsets.only(top: 12.0),
//             child: Text(
//               "Username",
//               style: TextStyle(color: Colors.grey),
//             )),
//         TextField(
//           controller: userNameController,
//           decoration: InputDecoration(
//             hintText: "Update Username",
//             errorText: _userNameValid ? null : "Username too short",
//           ),
//         )
//       ],
//     );
//   }
//
//   Column buildNusnetId() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(top: 12.0),
//           child: Text(
//             "NUSNET ID",
//             style: TextStyle(color: Colors.grey),
//           ),
//         ),
//         TextField(
//           controller: nusnetIdController,
//           decoration: InputDecoration(
//             hintText: "Update NUSNET ID",
//             errorText: _nusnetIdValid ? null : "NUSNET ID too long",
//           ),
//         )
//       ],
//     );
//   }
//
//   updateProfileData() {
//     setState(() {
//       userNameController.text.trim().length < 3 ||
//           userNameController.text.isEmpty
//           ? _userNameValid = false
//           : _userNameValid = true;
//       nusnetIdController.text.trim().length > 8
//           ? _nusnetIdValid = false
//           : _nusnetIdValid = true;
//     });
//
//     if (_userNameValid && _nusnetIdValid) {
//       FirebaseFirestore.instance.collection('Users').doc(widget.currentUserId).update({
//         "userName": userNameController.text,
//         "nusnetId": nusnetIdController.text,
//       });
//       SnackBar snackbar = SnackBar(content: Text("Profile updated!"));
//       _scaffoldKey.currentState.showSnackBar(snackbar);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Edit Profile",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: Icon(
//               Icons.done,
//               size: 30.0,
//               color: Colors.green,
//             ),
//           ),
//         ],
//       ),
//       body: isLoading
//           ? CircularProgressIndicator()
//           : ListView(
//         children: <Widget>[
//           Container(
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Column(
//                     children: <Widget>[
//                       buildUserNameField(),
//                       buildNusnetId(),
//                     ],
//                   ),
//                 ),
//                 RaisedButton(
//                   onPressed: updateProfileData,
//                   child: Text(
//                     "Update Profile",
//                     style: TextStyle(
//                       color: Theme.of(context).primaryColor,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Profile/profile_screen.dart';
import 'package:flutter_firebase_login/cloud_firestore/user_ref.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
    User getUser = await FirebaseAuth.instance.currentUser;
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

  updateData(
      String userName, String email, String nusnetId, String userID) async {
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
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    openDialogueBox(context);
                  },
                  child: Text("Edit Profile"),
                style: ElevatedButton.styleFrom(primary: Color.fromRGBO(237, 148, 99, 1),),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Go Back"),
                style: ElevatedButton.styleFrom(primary: Color.fromRGBO(237, 148, 99, 1),),
              ),

            ],
          ),
        ));
  }

  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit User Details'),
            content: Container(
              height: 150,
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
            actions: [
              FlatButton(
                onPressed: () {
                  submitAction(context);
                  // setState(() {
                  //
                  // });
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }

  submitAction(BuildContext context) {
    updateData(_userNameController.text, _emailController.text,
        _nusnetIdController.text, userID);
    _userNameController.clear();
    _emailController.clear();
    _nusnetIdController.clear();
  }
}
