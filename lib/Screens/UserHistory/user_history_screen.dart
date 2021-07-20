// @dart=2.9
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_firebase_login/cloud_firestore/all_facility_ref.dart';
import 'package:flutter_firebase_login/cloud_firestore/user_ref.dart';
import 'package:flutter_firebase_login/model/booking_model.dart';
import 'package:flutter_firebase_login/model/court_model.dart';
import 'package:flutter_firebase_login/model/facility_model.dart';
import 'package:flutter_firebase_login/model/hall_model.dart';
import 'package:flutter_firebase_login/state/state_management.dart';
import 'package:flutter_firebase_login/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:im_stepper/stepper.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UserHistory extends ConsumerWidget {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var watchRefresh = watch(deleteFlagRefresh).state;
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("User History", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(223, 228, 254, 1),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: true,
          backgroundColor: Color.fromRGBO(202, 246, 251, 1),
      // backgroundColor: Color.fromRGBO(255, 255, 255, 1),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: displayUserHistory(),
      ),
    ));
  }

  displayUserHistory() {
    return FutureBuilder(
        future: getUserHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var userBookings = snapshot.data as List<BookingModel>;
            if (userBookings == null || userBookings.length == 0)
              return Center(
                child: Text('Cannot load user booking information'),
              );
            else
              return FutureBuilder(
                  future: syncTime(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    else {
                      var syncTime = snapshot.data as DateTime;
                      return ListView.builder(
                          itemCount: userBookings.length,
                          itemBuilder: (context, index) {
                            var isExpired = DateTime.fromMillisecondsSinceEpoch(
                                    userBookings[index].timeStamp)
                                .isBefore(syncTime);
                            return Card(
                              color: Color.fromRGBO(254, 241, 170, 1),
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(22))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text('Date'),
                                                Text(
                                                  DateFormat("dd/MM/yy").format(
                                                      DateTime
                                                          .fromMillisecondsSinceEpoch(
                                                              userBookings[
                                                                      index]
                                                                  .timeStamp)),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text('Time'),
                                                Text(
                                                  TIME_SLOT.elementAt(
                                                      userBookings[index].slot),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${userBookings[index].facilityName}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${userBookings[index].courtName}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '${userBookings[index].facilityAddress}',
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: isExpired
                                        ? null
                                        : () {
                                            Alert(
                                                context: context,
                                                type: AlertType.warning,
                                                title: 'DELETE BOOKING',
                                                desc:
                                                    "Don't forget to delete the booking in your calendar",
                                                buttons: [
                                                  DialogButton(
                                                    child: Text(
                                                      'CANCEL',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    color: Color.fromRGBO(
                                                        254, 241, 170, 1),
                                                  ),
                                                  DialogButton(
                                                    child: Text(
                                                      'DELETE',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      cancelBooking(context,
                                                          userBookings[index]);
                                                    },
                                                    color: Color.fromRGBO(
                                                        254, 241, 170, 1),
                                                  ),
                                                ]).show();
                                          },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        // color: Color.fromRGBO(254, 241, 170, 1),
                                        color: Color.fromRGBO(253, 204, 213, 1),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(22),
                                            bottomLeft: Radius.circular(22)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Text(
                                              userBookings[index].done
                                                  ? 'FINISH'
                                                  : isExpired
                                                      ? 'EXPIRED'
                                                      : 'CANCEL',
                                              style: TextStyle(
                                                  color: isExpired
                                                      ? Colors.grey
                                                      : Colors.black),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                  });
          }
        });
  }

  void cancelBooking(BuildContext context, BookingModel bookingModel) {
    var batch = FirebaseFirestore.instance.batch();
    var courtBooking = FirebaseFirestore.instance
        .collection('AllFacility')
        .doc(bookingModel.hallBook)
        .collection('Branch')
        .doc(bookingModel.facilityId)
        .collection('Court')
        .doc(bookingModel.courtId)
        .collection(DateFormat('dd_MM_yyyy').format(DateTime.fromMillisecondsSinceEpoch(bookingModel.timeStamp)))
        .doc(bookingModel.slot.toString());
    var userBooking = bookingModel.reference;

    //Delete
    batch.delete(userBooking);
    batch.delete(courtBooking);

    batch.commit().then((value) {
      //Refresh Data
      context.read(deleteFlagRefresh).state = !context.read(deleteFlagRefresh).state;
    });
  }
}
