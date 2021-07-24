// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_login/models/bookings.dart';

class FirestoreBookingService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //Get Bookings
  Stream<List<Bookings>> getBookings() {
    return _db.collection('bookings').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Bookings.fromJson(doc.data())).toList());
  }

  //Upsert
  Future<void> setBookings(Bookings booking) {
    var options = SetOptions(merge: true);
    return _db
        .collection('bookings')
        .doc(booking.bookingId)
        .set(booking.toMap(), options);
  }

  //Delete
  Future<void> removeBookings(String bookingId) {
    return _db.collection('bookings').doc(bookingId).delete();
  }
}
