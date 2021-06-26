// @dart=2.9
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Bookings/entry.dart';
import 'package:flutter_firebase_login/models/entry.dart';
import 'package:flutter_firebase_login/providers/entry_provider.dart';
import 'package:provider/provider.dart';

class ReviewBookingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text("Review Bookings"),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Entry>>(
          stream: entryProvider.entries,
          builder: (context, snapshot) {
            return ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    // title: Text(
                    //   formatDate(DateTime.parse(snapshot.data[index].date), [MM, ' ', d, ', ', yyyy]),
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    title: RichText(
                      text: TextSpan(text: snapshot.data[index].entry,
                          style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.black),
                          children: [
                            TextSpan(
                              text: ": ",
                            ),
                            TextSpan(
                              text: formatDate(
                                  DateTime.parse(snapshot.data[index].date),
                                  [MM, ' ', d, ', ', yyyy]),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EntryScreen(entry: snapshot.data[index])));
                    },
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                  return Divider(height: 1, thickness: 2, color: Colors.black,);
            },);
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EntryScreen()));
        },
      ),
    );
  }
}
