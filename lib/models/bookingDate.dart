// @dart=2.9
import 'dart:collection';

import 'package:flutter_firebase_login/models/timeslot.dart';

class BookingDate {
  HashSet<TimeSlot> timeSlots;
  DateTime date;

  BookingDate(DateTime date) {
    this.date = date;
    this.timeSlots = new HashSet();
  }

  factory BookingDate.fromJson(Map<String, dynamic> json) {
    return BookingDate(json['date']);
  }

  bool isBooked(TimeSlot ts) {
    return timeSlots.contains(ts);
  }

  bool bookTimeSlot(TimeSlot ts) {
    if (ts.startTime < 8 && ts.startTime > 21) {
      return false;
    }
    if (timeSlots.contains(ts)) {
      return false;
    }
    timeSlots.add(ts);
    return true;
  }

  bool removeTimeSlot(TimeSlot ts) {
    return timeSlots.remove(ts);
  }

  void add(Duration d) {
    this.date.add(d);
  }

  Map<String, dynamic> toMap() {
    return {
      'date': this.date,
    };
  }
}
