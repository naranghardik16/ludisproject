// @dart=2.9
import 'package:flutter/material.dart';
class UserData {
  final String uid;
  final String displayName;
  final String creationDate;
  final int avatar;

  const UserData ({
    this.uid,
    this.displayName,
    this.creationDate,
    this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json){
    return UserData(
      uid: json['UID'].toString(),
      displayName: json['DisplayName'].toString(),
      creationDate: json['CreationDate'].toString(),
      avatar: json['Avatar'] as int,
    );
  }
}