// @dart=2.9
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_firebase_login/cloud_firestore/all_facility_ref.dart';
import 'package:flutter_firebase_login/model/booking_model.dart';
import 'package:flutter_firebase_login/model/court_model.dart';
import 'package:flutter_firebase_login/model/facility_model.dart';
import 'package:flutter_firebase_login/model/hall_model.dart';
import 'package:flutter_firebase_login/state/state_management.dart';
import 'package:flutter_firebase_login/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:im_stepper/stepper.dart';
import 'package:intl/intl.dart';

class FacilityBookingScreen extends ConsumerWidget {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var step = watch(currentStep).state;
    var hallWatch = watch(selectedHall).state;
    var facilityWatch = watch(selectedFacility).state;
    var courtWatch = watch(selectedCourt).state;
    var dateWatch = watch(selectedDate).state;
    var timeWatch = watch(selectedTime).state;
    var timeSlotWatch = watch(selectedTime).state;
    return SafeArea(
        child: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                "Booking",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(223, 228, 254, 1),
              automaticallyImplyLeading: false,
            ),
            resizeToAvoidBottomInset: true,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            // backgroundColor: Color.fromRGBO(254, 241, 170, 1),

            body: Column(
              children: [
                //Step
                IconStepper(
                  lineColor: Colors.black,
                  activeStep: step - 1,
                  direction: Axis.horizontal,
                  enableNextPreviousButtons: false,
                  icons: [
                    Icon(Icons.home_work),
                    Icon(Icons.sports_baseball_sharp),
                    Icon(Icons.sports_tennis),
                    Icon(Icons.calendar_today),
                    Icon(Icons.check_box_rounded)
                  ],
                  // numbers: [1, 2, 3, 4, 5],
                  stepColor: Color.fromRGBO(254, 241, 170, 1),
                  activeStepColor: Color.fromRGBO(202, 246, 251, 1),
                  // numberStyle: TextStyle(color: Colors.black),
                ),
                //Screen
                Expanded(
                  flex: 10,
                  child: step == 1
                      ? displayHallList()
                      : step == 2
                          ? displayFacility(hallWatch.name)
                          : step == 3
                              ? displayCourt(facilityWatch)
                              : step == 4
                                  ? displayTimeSlot(context, courtWatch)
                                  : step == 5
                                      ? displayConfirm(context)
                                      : Container(),
                ),
                //Button
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: ElevatedButton(
                          onPressed: step == 1
                              ? null
                              : () => context.read(currentStep).state--,
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(223, 228, 254, 1)),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.navigate_before,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Previous",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          // child: Text(
                          //   'Previous',
                          //   style: TextStyle(color: Colors.black),
                          // ),
                        )),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (step == 1 &&
                                        context.read(selectedHall).state.name ==
                                            null) ||
                                    (step == 2 &&
                                        context
                                                .read(selectedFacility)
                                                .state
                                                .docId ==
                                            null) ||
                                    (step == 3 &&
                                        context
                                                .read(selectedCourt)
                                                .state
                                                .docId ==
                                            null) ||
                                    (step == 4 &&
                                        context.read(selectedTimeSlot).state ==
                                            -1)
                                ? null
                                : step == 5
                                    ? null
                                    : () => context.read(currentStep).state++,
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(223, 228, 254, 1)),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  "Next",
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            // child: Text(
                            //   'Next',
                            //   style: TextStyle(color: Colors.black),
                            // ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            )));
  }

  displayHallList() {
    return FutureBuilder(
        future: getHalls(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var halls = snapshot.data as List<HallModel>;
            if (halls == null || halls.length == 0)
              return Center(
                child: Text('Cannot load hall list'),
              );
            else
              return ListView.builder(
                  itemCount: halls.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () =>
                          context.read(selectedHall).state = halls[index],
                      child: SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.all(5.0),
                          elevation: 5,
                          color: Color.fromRGBO(253, 204, 213, 1),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  '${halls[index].imgPath}',
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: ListTile(
                                  trailing:
                                      context.read(selectedHall).state.name ==
                                              halls[index].name
                                          ? Icon(Icons.check)
                                          : null,
                                  title: Text(
                                    '${halls[index].name}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  subtitle: Text('${halls[index].address}'),
                                  dense: true,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
          }
        });
  }

  displayFacility(String hallName) {
    return FutureBuilder(
        future: getFacilityByHall(hallName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var facilities = snapshot.data as List<FacilityModel>;
            if (facilities == null || facilities.length == 0)
              return Center(
                child: Text('Cannot load facility list'),
              );
            else
              return ListView.builder(
                  itemCount: facilities.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => context.read(selectedFacility).state =
                          facilities[index],
                      child: SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.all(5.0),
                          elevation: 5.0,
                          color: Color.fromRGBO(253, 204, 213, 1),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  '${facilities[index].imgPath}',
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: ListTile(
                                  trailing: context
                                              .read(selectedFacility)
                                              .state
                                              .docId ==
                                          facilities[index].docId
                                      ? Icon(
                                          Icons.check,
                                        )
                                      : null,
                                  title: Text(
                                    '${facilities[index].name}',
                                  ),
                                  subtitle: Text(
                                    '${facilities[index].address}',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
          }
        });
  }

  displayCourt(FacilityModel facilityModel) {
    return FutureBuilder(
        future: getCourtsByFacility(facilityModel),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var courts = snapshot.data as List<CourtModel>;
            if (courts == null || courts.length == 0)
              return Center(
                child: Text('Court list are empty'),
              );
            else
              return ListView.builder(
                  itemCount: courts.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () =>
                          context.read(selectedCourt).state = courts[index],
                      child: Card(
                        color: Color.fromRGBO(253, 204, 213, 1),
                        child: ListTile(
                          leading: Icon(
                            Icons.sports_tennis_outlined,
                            color: Colors.black,
                          ),
                          trailing: context.read(selectedCourt).state.docId ==
                                  courts[index].docId
                              ? Icon(
                                  Icons.check,
                                )
                              : null,
                          title: Text(
                            '${courts[index].name}',
                          ),
                        ),
                      ),
                    );
                  });
          }
        });
  }

  displayTimeSlot(BuildContext context, CourtModel courtModel) {
    var now = context.read(selectedDate).state;
    return Column(
      children: [
        Container(
          color: Color.fromRGBO(224, 250, 252, 1),
          // color: Color(0xFF008577),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        '${DateFormat.MMMM().format(now)}',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '${now.day}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Text(
                        '${DateFormat.EEEE().format(now)}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              )),
              GestureDetector(
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      maxTime: now.add(Duration(days: 7)),
                      onConfirm: (date) =>
                          context.read(selectedDate).state = date);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      )),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: getMaxAvailableTimeSlot(context.read(selectedDate).state),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else {
                var maxTimeSlot = snapshot.data as int;
                return FutureBuilder(
                  future: getTimeSlotOfCourt(
                    courtModel,
                    DateFormat('dd_MM_yyyy')
                        .format(context.read(selectedDate).state),
                  ),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      var listTimeSlot = snapshot.data as List<int>;
                      return GridView.builder(
                          itemCount: TIME_SLOT.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: maxTimeSlot > index ||
                                        listTimeSlot.contains(index)
                                    ? null
                                    : () {
                                        context.read(selectedTime).state =
                                            TIME_SLOT.elementAt(index);
                                        context.read(selectedTimeSlot).state =
                                            index;
                                      },
                                child: Card(
                                  color: listTimeSlot.contains(index)
                                      ? Color.fromRGBO(254, 241, 170, 1)
                                      : maxTimeSlot > index
                                          ? Color.fromRGBO(167, 123, 180, 1)
                                          : context.read(selectedTime).state ==
                                                  TIME_SLOT.elementAt(index)
                                              ? Color.fromRGBO(202, 246, 251, 1)
                                              : Color.fromRGBO(
                                                  253, 204, 213, 1),
                                  child: GridTile(
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('${TIME_SLOT.elementAt(index)}'),
                                          Text(listTimeSlot.contains(index)
                                              ? 'Full'
                                              : maxTimeSlot > index
                                                  ? 'Not Available'
                                                  : 'Available')
                                        ],
                                      ),
                                    ),
                                    header: context.read(selectedTime).state ==
                                            TIME_SLOT.elementAt(index)
                                        ? Icon(Icons.check)
                                        : null,
                                  ),
                                ),
                              ));
                    }
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }

  confirmBooking(BuildContext context) {
    var hour = context.read(selectedTime).state.length <= 10
        ? int.parse(
            context.read(selectedTime).state.split(':')[0].substring(0, 1))
        : int.parse(
            context.read(selectedTime).state.split(':')[0].substring(0, 2));

    var minutes = context.read(selectedTime).state.length <= 10
        ? int.parse(
            context.read(selectedTime).state.split(':')[1].substring(0, 1))
        : int.parse(
            context.read(selectedTime).state.split(':')[1].substring(0, 2));

    var timeStamp = DateTime(
      context.read(selectedDate).state.year,
      context.read(selectedDate).state.month,
      context.read(selectedDate).state.day,
      hour,
      minutes,
    ).millisecondsSinceEpoch;
    //Creating Booking Model
    var bookingModel = BookingModel(
        courtId: context.read(selectedCourt).state.docId,
        courtName: context.read(selectedCourt).state.name,
        hallBook: context.read(selectedHall).state.name,
        email: FirebaseAuth.instance.currentUser.email,
        uid: FirebaseAuth.instance.currentUser.uid,
        nusnetId: context.read(userInformation).state.nusnetId,
        done: false,
        facilityAddress: context.read(selectedFacility).state.address,
        facilityId: context.read(selectedFacility).state.docId,
        facilityName: context.read(selectedFacility).state.name,
        slot: context.read(selectedTimeSlot).state,
        timeStamp: timeStamp,
        time:
            '${context.read(selectedTime).state} - ${DateFormat('dd/MM/yyyy').format(context.read(selectedDate).state)}');

    var batch = FirebaseFirestore.instance.batch();

    DocumentReference courtBooking = context
        .read(selectedCourt)
        .state
        .reference
        .collection(
            '${DateFormat('dd_MM_yyyy').format(context.read(selectedDate).state)}')
        .doc(context.read(selectedTimeSlot).state.toString());

    DocumentReference userBooking = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('Booking_${FirebaseAuth.instance.currentUser.uid}')
        .doc();

    // Set for batch
    batch.set(courtBooking, bookingModel.toJson());
    batch.set(userBooking, bookingModel.toJson());
    batch.commit().then((value) {
      ScaffoldMessenger.of(scaffoldKey.currentContext).showSnackBar(SnackBar(
        content: Text('Booking Successful'),
      ));
      // Reset Value
      context.read(selectedDate).state = DateTime.now();
      context.read(selectedCourt).state = CourtModel();
      context.read(selectedHall).state = HallModel();
      context.read(selectedFacility).state = FacilityModel();
      context.read(currentStep).state = 1;
      context.read(selectedTime).state = '';
      context.read(selectedTimeSlot).state = -1;

      //Create Event

      final event = Event(
          title: 'Facility Booking',
          description: 'Facility Booking ${context.read(selectedTime).state} - '
              '${DateFormat('dd/MM/yyyy').format(context.read(selectedDate).state)}',
          location: '${context.read(selectedFacility).state.address}',
          startDate: DateTime(
              context.read(selectedDate).state.year,
              context.read(selectedDate).state.month,
              context.read(selectedDate).state.day,
              hour,
              minutes),
          endDate: DateTime(
              context.read(selectedDate).state.year,
              context.read(selectedDate).state.month,
              context.read(selectedDate).state.day,
              hour,
              minutes + 60),
          iosParams: IOSParams(reminder: Duration(minutes: 60)),
          androidParams: AndroidParams(emailInvites: []));

      Add2Calendar.addEvent2Cal(event).then((value) {});
    });

    // Navigator.of(context).pop();
  }

  displayConfirm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Image.asset('assets/images/ludisLogo.png'),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Color.fromRGBO(254, 241, 170, 1),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Thanks for  choosing us!'.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('This is your Booking Information'.toUpperCase()),
                      Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                              '${context.read(selectedTime).state} - ${DateFormat('dd/MM/yyyy').format(context.read(selectedDate).state)}')
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.sports_baseball),
                          SizedBox(
                            width: 20,
                          ),
                          Text('${context.read(selectedCourt).state.name}')
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Icon(Icons.sports_tennis_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          Text('${context.read(selectedFacility).state.name}')
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                              '${context.read(selectedFacility).state.address}')
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () => confirmBooking(context),
                        child: Text(
                          'Confirm Booking',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(253, 204, 213, 1))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
