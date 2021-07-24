// @dart=2.9


class TimeSlot {
  int startTime;

  // int endTime;

  TimeSlot({this.startTime});

  // timeslot(int startTime, int endTime) {
  //
  //   this.startTime = startTime;
  //   this.endTime = startTime + 1;
  // }

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
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
