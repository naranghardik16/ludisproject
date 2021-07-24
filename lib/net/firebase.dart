// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> userSetup(BuildContext context, String userName, String nusnetId,
    String email) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  var firebaseUser = auth.currentUser;
  DocumentReference users =
      FirebaseFirestore.instance.collection('Users').doc(firebaseUser.uid);
  String uid = auth.currentUser.uid.toString();
  users.set(
      {'userName': userName, 'uid': uid, 'nusnetId': nusnetId, 'email': email});
  return;
}
