// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/models/bookings.dart';
import 'package:flutter_firebase_login/src/services/firestore_booking_service.dart';
import 'package:uuid/uuid.dart';

class BookingProvider with ChangeNotifier {
  final firestoreBookingService = FirestoreBookingService();
  DateTime _date;

  // DateTime _time;
  String _booking;
  String _bookingId;
  var uuid = Uuid();

  //Getters
  DateTime get date => _date;

  // DateTime get time => _time;
  String get booking => _booking;

  Stream<List<Bookings>> get bookings => firestoreBookingService.getBookings();

  //Setters
  set changeDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  // set changeTime(DateTime time) {
  //   _time = time;
  //   notifyListeners();
  // }

  set changeBooking(String booking) {
    _booking = booking;
    notifyListeners();
  }

  //Functions
  loadAll(Bookings booking) {
    if (booking != null) {
      _date = DateTime.parse(booking.date);
      _booking = booking.booking;
      _bookingId = booking.bookingId;
    } else {
      _date = DateTime.now();
      _booking = null;
      _bookingId = null;
    }
  }

  saveBooking() {
    if (_bookingId == null) {
      //Add
      var newBooking = Bookings(
          date: _date.toIso8601String(),
          booking: _booking,
          bookingId: uuid.v1());
      print(newBooking.booking);
      firestoreBookingService.setBookings(newBooking);
    } else {
      //Edit
      var updatedBooking = Bookings(
          date: _date.toIso8601String(),
          booking: _booking,
          bookingId: _bookingId);
      firestoreBookingService.setBookings(updatedBooking);
    }
  }

  removeBooking(String bookingId) {
    firestoreBookingService.removeBookings(bookingId);
  }
}
