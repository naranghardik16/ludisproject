// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';

class FacilityModel{
  String name;
  String address;
  String docId;
  DocumentReference reference;

  FacilityModel({this.name, this.address});

  FacilityModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['name'] = this.name;
    return data;
  }

}