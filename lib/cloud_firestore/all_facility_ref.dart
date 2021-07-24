// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_login/model/court_model.dart';
import 'package:flutter_firebase_login/model/facility_model.dart';
import 'package:flutter_firebase_login/model/hall_model.dart';

Future<List<HallModel>> getHalls() async {
  var halls = new List<HallModel>.empty(growable: true);
  var hallRef = FirebaseFirestore.instance.collection('AllFacility');
  var snapshot = await hallRef.get();
  snapshot.docs.forEach((element) {
    halls.add(HallModel.fromJson(element.data()));
  });
  return halls;
}

Future<List<FacilityModel>> getFacilityByHall(String hallName) async {
  var facilities = new List<FacilityModel>.empty(growable: true);
  var facilityRef = FirebaseFirestore.instance
      .collection('AllFacility')
      .doc(hallName)
      .collection('Branch');
  var snapshot = await facilityRef.get();
  snapshot.docs.forEach((element) {
    var facility = FacilityModel.fromJson(element.data());
    facility.docId = element.id;
    facility.reference = element.reference;
    facilities.add(facility);
  });
  return facilities;
}

Future<List<CourtModel>> getCourtsByFacility(FacilityModel facility) async {
  var courts = new List<CourtModel>.empty(growable: true);
  var courtRef = facility.reference.collection('Court');
  var snapshot = await courtRef.get();
  snapshot.docs.forEach((element) {
    var court = CourtModel.fromJson(element.data());
    court.docId = element.id;
    court.reference = element.reference;
    courts.add(court);
  });
  return courts;
}

Future<List<int>> getTimeSlotOfCourt(CourtModel courtModel, String date) async {
  List<int> result = new List<int>.empty(growable: true);
  // var ref = CourtModel().refer;
  // var bookingRef = ref.collection(date);
  var bookingRef = courtModel.reference.collection(date);
  QuerySnapshot snapshot = await bookingRef.get();
  snapshot.docs.forEach((element) {
    result.add(int.parse(element.id));
  });
  return result;
}
