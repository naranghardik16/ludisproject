// @dart=2.9
import 'package:flutter/material.dart';
class User {

  final String userId;
  final String email;
  final String password;
  final String nusnetId;

  User({ this.email, this.password, this.nusnetId, this.userId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        password: json['password'],
        nusnetId: json['nusnetId'],
        userId: json['userId']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'nusnetId': nusnetId,
      'userId': userId,
    };
  }
}