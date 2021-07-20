// @dart=2.9
import 'package:flutter/material.dart';
class Entry {

  final String entryId;
  final String date;
  final String entry;
  // final String timeSlot;

  Entry({ this.date, this.entry, this.entryId});

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      date: json['date'],
      entry: json['entry'],
      entryId: json['entryId'],
      // timeSlot: json['timeSlot']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'entry': entry,
      'entryId': entryId,
      // 'timeSlot': timeSlot
    };
  }
}

