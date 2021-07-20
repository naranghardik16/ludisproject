// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/model/user_model.dart';
import 'package:flutter_firebase_login/state/state_management.dart';
import 'package:provider/provider.dart';

Future<void> userSetup(BuildContext context, String userName, String nusnetId, String email) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  var firebaseUser = await auth.currentUser;
  DocumentReference users = FirebaseFirestore.instance.collection('Users').doc(firebaseUser.uid);
  String uid = auth.currentUser.uid.toString();
  users.set({'userName': userName, 'uid': uid, 'nusnetId': nusnetId, 'email': email});
  return;
}

