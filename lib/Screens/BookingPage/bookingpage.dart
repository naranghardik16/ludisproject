import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Review/ReviewBookingsScreen.dart';
import 'dart:async';

import 'package:flutter_firebase_login/src/Screens/review.dart';

class BookingPage extends StatefulWidget {
  @override
  BookingPageState createState() => BookingPageState();
}

class BookingPageState extends State<BookingPage> {
  late List<String> facility = ['Select A Facility', 'BasketBall', 'Badminton', 'Tennis', 'Auditorium', 'Music Room', 'Table Tennis', 'Function Room', 'Reading Room', 'Student Lounge', 'TV Room'];
  late List<String> time = [  "08:00 - 09:00", "09:00 - 10:00", "10:00 - 11:00", "11:00 - 12:00", "13:00 - 14:00", "14:00 - 15:00", "15:00 - 16:00", "16:00 - 17:00", "17:00 - 18:00", "18:00 - 19:00", "19:00 - 20:00", "20:00 - 21:00", "21:00 - 22:00"];
  late List<bool> isSelectedRow1 = List.generate(4, (index) => false);
  late List<bool> isSelectedRow2 = List.generate(4, (index) => false);
  late List<bool> isSelectedRow3 = List.generate(4, (index) => false);
  late List<bool> isSelectedRow4 = List.generate(2, (index) => false);
  late DateTime currentDate = DateTime.now();
  late DateTime maxDate = DateTime.now().add(const Duration(days: 7));
  late int rowTimeIndex1;
  late int colTimeIndex1;
  late bool validSearch;
  late bool renderTimeGrid;
  late String selectedFacility;
  late String selectedDate;
  late String selectedTime;

  BookingPageState() {
    selectedFacility = 'Select A Facility';
    selectedDate = 'Select A Date';
    validSearch = false;
    renderTimeGrid = false;
    rowTimeIndex1 = -1;
    colTimeIndex1 = -1;
    clearAllToggleButtons();
  }
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime.now(),
        lastDate: maxDate
    );
    if (pickedDate != null) {
      setState(() {
        if (pickedDate.month < 10) {
          selectedDate = pickedDate.day.toString() + "/0" + pickedDate.month.toString() + "/" + pickedDate.year.toString();
        } else {
          selectedDate = pickedDate.day.toString() + "/" + pickedDate.month.toString() + "/" + pickedDate.year.toString();
        }
        rowTimeIndex1 = -1;
        colTimeIndex1 = -1;
        currentDate = pickedDate;
        validSearch = (selectedDate != 'Select A Date' && selectedFacility != 'Select A Facility');
        renderTimeGrid = false;
        clearAllToggleButtons();
      });
    }
  }

  void selectTime() {
    if (rowTimeIndex1 != -1 && colTimeIndex1 != -1) {
      switch (rowTimeIndex1) {
        case 1:
          {
            isSelectedRow1[colTimeIndex1] = !isSelectedRow1[colTimeIndex1];
            break;
          }
        case 2:
          {
            isSelectedRow2[colTimeIndex1] = !isSelectedRow2[colTimeIndex1];
            break;
          }
        case 3:
          {
            isSelectedRow3[colTimeIndex1] = !isSelectedRow3[colTimeIndex1];
            break;
          }
        case 4:
          {
            isSelectedRow4[colTimeIndex1] = !isSelectedRow4[colTimeIndex1];
            break;
          }
      }
    } else {

    }
  }

  showInvalidSearchAlertDialog(BuildContext context) {
    AlertDialog invalidSearch = AlertDialog(
      title: Text("ERROR", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20)),
      content: Text("Please Select Both the Facility and Date"),
      actions: <Widget>[new TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("OK"))],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return invalidSearch;
      },
    );
  }

  showInvalidTimeSelectAlertDialog(BuildContext context) {
    AlertDialog invalidTimeSelect = AlertDialog(
      title: Text("ERROR", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20)),
      content: Text("Please Select Maximum 2 Hour Slots"),
      actions: <Widget>[new TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("OK"))],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return invalidTimeSelect;
      },
    );
  }

  showInvalidBookingFacilityAlertDialog(BuildContext context) {
    AlertDialog invalidTimeSelect = AlertDialog(
      title: Text("ERROR", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20)),
      content: Text("Please Select A Facility, Date and Time Slot"),
      actions: <Widget>[new TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("OK"))],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return invalidTimeSelect;
      },
    );
  }

  void clearAllToggleButtons() {
    for(int index = 0; index < isSelectedRow1.length; index++) {
      isSelectedRow1[index] = false;
    }
    for(int index = 0; index < isSelectedRow2.length; index++) {
      isSelectedRow2[index] = false;
    }
    for(int index = 0; index < isSelectedRow3.length; index++) {
      isSelectedRow3[index] = false;
    }
    for(int index = 0; index < isSelectedRow4.length; index++) {
      isSelectedRow4[index] = false;
    }
  }

  void searchTime(BuildContext context) {
    // Query Booking Table and check if current user has booked 2 hours of the given facility
    // if not then Query Facility Table and get time data
    setState(() {
      renderTimeGrid = true;
    });
  }

  bookFacility(BuildContext context) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Booking Page"),
          // backgroundColor: Colors.blue,
          backgroundColor: Color.fromRGBO(237, 148, 99, 1),

          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        // backgroundColor: Colors.orangeAccent,
        backgroundColor: Color.fromRGBO(95, 106, 228, 1),
        body: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(bottom: 15.0)),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  dropdownColor: Colors.white,
                                  value: selectedFacility,
                                  selectedItemBuilder: (BuildContext context) {
                                    return facility.map((String value) {
                                      return Text(
                                          "  " + selectedFacility,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal
                                          )
                                      );
                                    }).toList();
                                  },
                                  items: facility.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                          value,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal)
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      selectedFacility = val!;
                                      validSearch = (selectedDate != 'Select A Date' && selectedFacility != 'Select A Facility');
                                      renderTimeGrid = false;
                                      rowTimeIndex1 = -1;
                                      colTimeIndex1 = -1;
                                      clearAllToggleButtons();
                                    });
                                  },
                                  focusColor: Colors.green,
                                ),
                              ]
                          )
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
                      Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: TextButton(
                          onPressed: () => selectDate(context),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              selectedDate,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
                      Column(
                        children: [
                          if (!renderTimeGrid)
                            MaterialButton(
                              color: validSearch ? Color.fromRGBO(237, 148, 99, 1) : Colors.redAccent,
                              onPressed: () =>
                              validSearch
                                  ? searchTime(context)
                                  : showInvalidSearchAlertDialog(context),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Search",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ),
                            ),
                          if(renderTimeGrid)
                            Container(
                                padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Column(
                                  children: [
                                    ToggleButtons(
                                      children: <Widget>[
                                        Text(" 08:00 - 09:00 ", style: TextStyle(color: Colors.black),),
                                        Text(" 09:00 - 10:00 ", style: TextStyle(color: Colors.black),),
                                        Text(" 10:00 - 11:00 ", style: TextStyle(color: Colors.black),),
                                        Text(" 11:00 - 12:00 ", style: TextStyle(color: Colors.black),),
                                      ],
                                      onPressed: (int index) {
                                        setState(() {
                                          rowTimeIndex1 = 1;
                                          colTimeIndex1 = index;
                                          clearAllToggleButtons();
                                          selectTime();
                                        });
                                      },
                                      borderColor: Colors.black,
                                      selectedBorderColor: Colors.black,
                                      fillColor: Colors.lightGreen,
                                      selectedColor: Colors.white,
                                      isSelected: isSelectedRow1,
                                    ),
                                    ToggleButtons(
                                      children: <Widget>[
                                        Text(" 12:00 - 13:00 ", style: TextStyle(color: Colors.black),),
                                        Text(" 13:00 - 14:00 ", style: TextStyle(color: Colors.black),),
                                        Text(" 14:00 - 15:00 ", style: TextStyle(color: Colors.black),),
                                        Text(" 15:00 - 16:00 ", style: TextStyle(color: Colors.black),),
                                      ],
                                      onPressed: (int index) {
                                        setState(() {
                                          rowTimeIndex1 = 2;
                                          colTimeIndex1 = index;
                                          clearAllToggleButtons();
                                          selectTime();
                                        });
                                      },borderColor: Colors.black,
                                      selectedBorderColor: Colors.black,
                                      fillColor: Colors.lightGreen,
                                      selectedColor: Colors.white,
                                      isSelected: isSelectedRow2,
                                    ),
                                    ToggleButtons(
                                      children: <Widget>[
                                        Text(" 16:00 - 17:00 ", style: TextStyle(color: Colors.black),),
                                        Text(" 17:00 - 18:00 ", style: TextStyle(color: Colors.black),),
                                        Text(" 18:00 - 19:00 ", style: TextStyle(color: Colors.black),),
                                        Text(" 19:00 - 20:00 ", style: TextStyle(color: Colors.black),),
                                      ],
                                      onPressed: (int index) {
                                        setState(() {
                                          rowTimeIndex1 = 3;
                                          colTimeIndex1 = index;
                                          clearAllToggleButtons();
                                          selectTime();
                                        });
                                      },borderColor: Colors.black,
                                      selectedBorderColor: Colors.black,
                                      fillColor: Colors.lightGreen,
                                      selectedColor: Colors.white,
                                      isSelected: isSelectedRow3,
                                    ),
                                    ToggleButtons(
                                      children: <Widget>[
                                        Text(" 20:00 - 21:00 ", style: TextStyle(color: Colors.black),),
                                        Text(" 21:00 - 22:00 ", style: TextStyle(color: Colors.black),),
                                      ],
                                      onPressed: (int index) {
                                        setState(() {
                                          rowTimeIndex1 = 4;
                                          colTimeIndex1 = index;
                                          clearAllToggleButtons();
                                          selectTime();
                                        });
                                      },borderColor: Colors.black,
                                      selectedBorderColor: Colors.black,
                                      fillColor: Colors.lightGreen,
                                      selectedColor: Colors.white,
                                      isSelected: isSelectedRow4,
                                    ),
                                  ],
                                )
                            ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
                      if (renderTimeGrid)
                        MaterialButton(
                          color: rowTimeIndex1 != -1 && colTimeIndex1 != -1 ? Colors.redAccent : Color.fromRGBO(237, 148, 99, 1),
                          onPressed: () =>
                          rowTimeIndex1 != -1 && colTimeIndex1 != -1
                              ? Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewBookingsScreen()))
                              : showInvalidBookingFacilityAlertDialog(context),
                          // onPressed: () =>
                          // rowTimeIndex1 != -1 && colTimeIndex1 != -1
                          //     ? bookFacility(context)
                          //     : showInvalidBookingFacilityAlertDialog(context),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Book Facility",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
                        ),
                    ]
                )
            )
          ],
        )
    );
  }
}