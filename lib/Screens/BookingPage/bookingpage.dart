import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class BookingPage extends StatefulWidget {
  @override
  BookingPageState createState() => BookingPageState();
}

class BookingPageState extends State<BookingPage> {
  final List<String> facility = ['Select A Facility', 'BasketBall', 'Badminton', 'Tennis', 'Auditorium', 'Music Room', 'Table Tennis', 'Function Room'];
  final List<String> basketBall = ['Court 1', 'Court 2', 'Court 3', 'Court 4'];
  final List<String> badminton = ['Court 1', 'Court 2', 'Court 3'];
  final List<String> tableTennis = ['Table 1', 'Table 2'];
  final List<String> functionRoom = ['Room 1', 'Room 2', 'Room 3', 'Room 4'];
  List<bool> selected = List.generate(6, (index) => false);
  List<String> timeColor = List.generate(6, (index) => "Free");

  late String selectedFacility;
  //final String? selectedFacilitySpecifics;
  late String selectedDate;
  late bool validSearch =  false;
  late bool renderTimeGrid;
  List<String> time = ["08:00 - 09:00", "09:00 - 10:00", "10:00 - 11:00",
                       "11:00 - 12:00", "13:00 - 14:00", "14:00 - 15:00",
                       "15:00 - 16:00", "16:00 - 17:00", "17:00 - 18:00",
                       "18:00 - 19:00", "19:00 - 20:00", "20:00 - 21:00",
                       "21:00 - 22:00"];


  DateTime currentDate = DateTime.now();
  DateTime maxDate = DateTime.now().add(const Duration(days: 7));

  BookingPageState() {
    selectedFacility = 'Select A Facility';
    selectedDate = 'Select A Date';
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
        currentDate = pickedDate;
        validSearch = (selectedDate != 'Select A Date' && selectedFacility != 'Select A Facility');
        renderTimeGrid = false;
      });
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

  Future<void> searchTime(BuildContext context) async {
    // Query Booking Table and check if current user has booked 2 hours of the given facility
    // if not then Query Facility Table and get time data
    renderTimeGrid = true;
  }

  @override
  Widget build(BuildContext context) {
    var counter = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Page"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.orangeAccent,
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
                MaterialButton(
                  color: validSearch? Colors.green : Colors.red,
                  onPressed: () => validSearch? searchTime(context) : showInvalidSearchAlertDialog(context),
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
                Padding(padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
                // GridView.count(
                //   crossAxisCount: 1,
                //   primary: false,
                //   scrollDirection: Axis.vertical,
                //   children: const <Widget>[
                //     Text("08:00 - 09:00"), Text("09:00 - 10:00"), Text("10:00 - 11:00"),
                //     Text("11:00 - 12:00"), Text("13:00 - 14:00"), Text("14:00 - 15:00"),
                //   ].asMap().entries.map((widget) {
                //     final index = ++counter - 1;
                //     return ToggleButtons(
                //       children: [widget.value],
                //       isSelected: [selected[index]],
                //       onPressed: (index) {
                //         (timeColor[index] == "Free") ? timeColor[index] = "Marked" : timeColor[index] = "Free";
                //         setState(() {
                //           (timeColor[index] == "Booked") ? selected[index] = selected[index] : selected[index] = !selected[index];
                //         });
                //       },
                //       borderColor: Colors.black,
                //       color: timeColor[index] == "Free"? Colors.green : (timeColor[index] == "Marked") ? Colors.blue : Colors.red,
                //       selectedColor: Colors.blue,
                //     );
                //   }).toList(),
                // ),

              ]
            )
          )
        ],
      )
    );
  }
}