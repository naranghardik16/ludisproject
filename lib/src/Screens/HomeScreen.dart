// @dart=2.9
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/Screens/entry.dart';
import 'package:flutter_firebase_login/src/models/entry.dart';
import 'package:flutter_firebase_login/src/providers/entry_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Journal"),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Entry>>(
          stream: entryProvider.entries,
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
                      formatDate(DateTime.parse(snapshot.data[index].date), [MM, ' ', d, ', ', yyyy])
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EntryScreen(entry: snapshot.data[index])));
                    },
                  );
                });
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
