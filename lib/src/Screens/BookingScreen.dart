// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/models/bookings.dart';
import 'package:flutter_firebase_login/providers/booking_provider.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  final Bookings booking;

  BookingScreen({this.booking});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  final bookingController = TextEditingController();

  @override
  void dispose() {
    bookingController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    final bookingProvider = Provider.of<BookingProvider>(context, listen: false);
    if(widget.booking != null) {
      //Edit
      bookingController.text = widget.booking.booking;
      bookingProvider.loadAll(widget.booking);
    } else {
      //Add
      bookingProvider.loadAll(null);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(context);
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text("Booking"),
        actions: [
          IconButton(
            onPressed: () {
              //add _pickDate function
              _pickDate(context, bookingProvider).then((value) {
                if(value != null) {
                  bookingProvider.changeDate = value;
                }
              });
            },
            icon: Icon(Icons.calendar_today))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Enter facility",
                border: InputBorder.none,
                ),
                maxLines: 1,
                minLines: 1,
                onChanged: (String value) => bookingProvider.changeBooking = value,
                controller: bookingController,
            ),
            RaisedButton(
              color: Colors.pinkAccent,
              child: Text('Save Booking',
               style: TextStyle(color: Colors.white)),
              onPressed: () {
                bookingProvider.saveBooking();
                Navigator.of(context).pop();
              },
            ),
            (widget.booking != null) ? RaisedButton(
              color: Colors.red,
              child: Text("Delete Booking", style: TextStyle(color: Colors.white)),
              onPressed: () {
                bookingProvider.removeBooking(widget.booking.bookingId);
                Navigator.of(context).pop();
              },
            ): Container(),
          ],
        )
      )
    );
  }

  Future<DateTime> _pickDate(BuildContext context, BookingProvider bookingProvider) async {
    final DateTime picked = await showDatePicker(
      context: context, initialDate: bookingProvider.date,
       firstDate: DateTime(2021), lastDate: DateTime(2022));

    if (picked != null) return picked;
  }
}