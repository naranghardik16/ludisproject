// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';

class FacilityModel{
  String name;
  String address;
  String imgPath;
  String docId;
  DocumentReference reference;

  FacilityModel({this.name, this.address, this.imgPath});

  FacilityModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
    imgPath = json['imgPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['name'] = this.name;
    data['imgPath'] = this.imgPath;
    return data;
  }

}