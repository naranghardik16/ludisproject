// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';

class CourtModel{
  String userName, name, docId;
  DocumentReference reference;

  CourtModel({this.userName, this.name});

  CourtModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['name'] = this.name;
    return data;
  }



}