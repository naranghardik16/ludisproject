// @dart=2.9
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Bookings/BookingScreen.dart';
import 'package:flutter_firebase_login/models/bookings.dart';
import 'package:flutter_firebase_login/providers/booking_provider.dart';
import 'package:provider/provider.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(context);
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Review",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<List<Bookings>>(
        stream: bookingProvider.bookings,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: Icon(
                  Icons.edit,
                  color: Colors.pinkAccent,
                ),
                title: Text(
                  formatDate(DateTime.parse(snapshot.data[index].date), [MM, ' ', d, ', ', yyyy]),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookingScreen(booking: snapshot.data[index])));
                },
              );
            },
          );
        },),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => BookingScreen()));
          },
        ),
    );
  }
}
