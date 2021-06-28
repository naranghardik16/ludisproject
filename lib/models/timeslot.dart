// @dart=2.9
import 'package:flutter/material.dart';
class timeslot {

  int startTime;
  // int endTime;

  timeslot({ this.startTime});

  // timeslot(int startTime, int endTime) {
  //
  //   this.startTime = startTime;
  //   this.endTime = startTime + 1;
  // }

  factory timeslot.fromJson(Map<String, dynamic> json) {
    return timeslot(
      startTime: json['startTime'],
      // endTime: json['endTime'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'startTime': this.startTime,
      // 'endTime': endTime,
    };
  }
}
