// @dart=2.9

import 'bookingDate.dart';

class Facility {
  List<BookingDate> availableDates;
  String facilityName;
  String facilityId;

  Facility(String name) {
    // this.availableDates = [];
    this.facilityName = name;
    BookingDate today = new BookingDate(DateTime.now());
    BookingDate temp = today;

    for (int i = 0; i < 7; i++) {
      availableDates.add(temp);
      temp.add(const Duration(days: 1));
    }
  }

  // HashMap<Facility, HashMap<DateTime, HashMap<TimeSlot, bool>>> map = new HashMap();

  // HashMap<DateTime, HashMap<Facility, List<TimeSlot>>> newMap = new HashMap();

  // Facility({ this.date, this.entry, this.entryId, this.timeSlot});

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(json['name']);
  }

  Map<String, dynamic> toMap() {
    return {'name': this.facilityName, 'facilityId': this.facilityId};
  }
}
