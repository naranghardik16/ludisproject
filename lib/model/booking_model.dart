// var submitData = {
//   'courtId': context.read(selectedCourt).state.docId,
//   'courtName': context.read(selectedCourt).state.name,
//   'hallBook': context.read(selectedHall).state.name,
//   'email': FirebaseAuth.instance.currentUser.email,
//   'uid': FirebaseAuth.instance.currentUser.uid,
//   'nusnetId': context.read(userInformation).state.nusnetId,
//   'done': false,
//   'facilityAddress': context.read(selectedFacility).state.address,
//   'facilityId': context.read(selectedFacility).state.docId,
//   'facilityName': context.read(selectedFacility).state.name,
//   'slot': context.read(selectedTimeSlot).state,
//   'timeStamp': timeStamp,
//   'time':
//   '${context.read(selectedTime).state} - ${DateFormat('dd/MM/yyyy').format(context.read(selectedDate).state)}'
//   // 'customerName': context.read(userInformation).state.docId,
// };
// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  String docId,
      courtId,
      courtName,
      hallBook,
      email,
      uid,
      nusnetId,
      facilityAddress,
      facilityId,
      facilityName,
      time;
  bool done;
  int slot, timeStamp;

  DocumentReference reference;

  BookingModel(
      {this.docId,
      this.courtId,
      this.courtName,
      this.hallBook,
      this.email,
      this.uid,
      this.nusnetId,
      this.facilityAddress,
      this.facilityId,
      this.facilityName,
      this.time,
      this.done,
      this.slot,
      this.timeStamp});

  BookingModel.fromJson(Map<String, dynamic> json) {
    courtId = json['courtId'];
    courtName = json['courtName'];
    hallBook = json['hallBook'];
    email = json['email'];
    uid = json['uid'];
    nusnetId = json['nusnetId'];
    facilityAddress = json['facilityAddress'];
    facilityId = json['facilityId'];
    facilityName = json['facilityName'];
    time = json['time'];
    done = json['done'] as bool;
    slot = int.parse(json['slot'] == null ? '-1' : json['slot'].toString());
    timeStamp = int.parse(
        json['timeStamp'] == null ? '0' : json['timeStamp'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courtId'] = this.courtId;
    data['courtName'] = this.courtName;
    data['hallBook'] = this.hallBook;
    data['email'] = this.email;
    data['uid'] = this.uid;
    data['nusnetId'] = this.nusnetId;
    data['facilityAddress'] = this.facilityAddress;
    data['facilityId'] = this.facilityId;
    data['facilityName'] = this.facilityName;
    data['time'] = this.time;
    data['done'] = this.done;
    data['slot'] = this.slot;
    data['timeStamp'] = this.timeStamp;
    return data;
  }
}
