// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_login/model/user_model.dart';
import 'package:flutter_firebase_login/state/state_management.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final CollectionReference userList =
FirebaseFirestore.instance.collection('Users');

Future<void> createUserData(
    String userName, String email, String nusnetId, String uid) async {
  return await userList
      .doc(uid)
      .set({'userName': userName, 'email': email, 'nusnetId': nusnetId});
}

Future updateUserList(String userName, String email, String nusnetId, String uid) async {
  return await userList.doc(uid).update({
    'userName': userName, 'email': email, 'nusnetId': nusnetId
  });
}

Future getUsersList() async {
  List itemsList = [];

  try {
    await userList.get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        itemsList.add(element.data);
      });
    });
    return itemsList;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future<UserModel> getUserProfiles(BuildContext context, String uid) async {
  CollectionReference userRef = FirebaseFirestore.instance.collection('Users');
  DocumentSnapshot snapshot = await userRef.doc(uid).get();
  if(snapshot.exists) {
    var userModel = UserModel.fromJson(snapshot.data());
    context.read(userInformation).state = userModel;
    return userModel;
  } else {
    return UserModel();
  }
}