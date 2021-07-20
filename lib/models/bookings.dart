// @dart=2.9
import 'package:flutter/material.dart';
class Bookings {
  final String bookingId;
  final String date;
  final String booking;
  // final String time;

  Bookings ({this.date, this.booking, this.bookingId});

  factory Bookings.fromJson(Map<String, dynamic> json) {
    return Bookings(
      date: json['date'],
      // time: json['time'],
      booking: json['booking'],
      bookingId: json['bookingId']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      // 'time': time,
      'booking': booking,
      'bookingId': bookingId,
    };
  }
}