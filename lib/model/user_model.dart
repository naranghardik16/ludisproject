// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class UserModel {

  // String userId;
  String userName;
  String email;
  String password;
  String nusnetId;

  UserModel({ this.email, this.password, this.nusnetId, this.userName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        password: json['password'],
        nusnetId: json['nusnetId'],
        userName: json['userName']
    );
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
        email: doc['email'],
        password: doc['password'],
        nusnetId: doc['nusnetId'],
        userName: doc['userName']
    );
  }
  // UserModel.fromJson(Map<String, dynamic> json) {
  //   email: json['email'];
  //   password: json['password'];
  //   nusnetId: json['nusnetId'];
  //   userId: json['userId'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['nusnetId'] = this.nusnetId;
    data['userName'] = this.userName;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'nusnetId': nusnetId,
      'userName': userName,
    };
  }
}