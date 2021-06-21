// @dart=2.9
// import 'package:date_format/date_format.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_login/src/models/entry.dart';
// import 'package:flutter_firebase_login/src/providers/entry_provider.dart';
// import 'package:provider/provider.dart';
//
// class EntryScreen extends StatefulWidget {
//   final Entry entry;
//
//   EntryScreen({this.entry});
//
//   @override
//   _EntryScreenState createState() => _EntryScreenState();
// }
//
// class _EntryScreenState extends State<EntryScreen> {
//   final entryController = TextEditingController();
//
//   @override
//   void dispose() {
//     entryController.dispose();
//     super.dispose();
//   }
//   @override
//   void initState() {
//     // ignore: unnecessary null comparison
//     final entryProvider = Provider.of<EntryProvider>(context, listen: false);
//     if(widget.entry != null) {
//       //Edit
//       entryController.text = widget.entry.entry;
//       entryProvider.loadAll(widget.entry);
//     } else {
//       //Add
//       entryProvider.loadAll(null);
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final entryProvider = Provider.of<EntryProvider>(context);
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(formatDate(entryProvider.date, [MM, ' ', d, ', ', yyyy])),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   _pickDate(context).then((value) {
//                     entryProvider.changeDate = value;
//                   });
//                 },
//                 icon: Icon(Icons.calendar_today))
//           ],
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: ListView(
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Daily Entry',
//                   border: InputBorder.none,
//                 ),
//                 maxLines: 12,
//                 minLines: 10,
//                 onChanged: (String value) => entryProvider.changeEntry = value,
//                 controller: entryController,
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(primary: Colors.pinkAccent),
//                 onPressed: () {
//                   entryProvider.saveEntry();
//                   Navigator.of(context).pop();
//                 },
//                 child: Text(
//                   "Save",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               (widget.entry != null)
//                   ? ElevatedButton(
//                       style: ElevatedButton.styleFrom(primary: Colors.red),
//                       onPressed: () {
//                         entryProvider.removeEntry(widget.entry.entryId);
//                         Navigator.of(context).pop();
//                       },
//                       child: Text(
//                         "Delete",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                   : Container(),
//             ],
//           ),
//         ));
//   }
//
//   Future<DateTime> _pickDate(BuildContext context) async {
//     final DateTime picked = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(2019),
//         lastDate: DateTime(2050));
//     if (picked != null) {
//       return picked;
//     }
//   }
// }
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/models/entry.dart';
import 'package:flutter_firebase_login/src/providers/entry_provider.dart';
import 'package:provider/provider.dart';

class EntryScreen extends StatefulWidget {
  final Entry entry;

  EntryScreen({this.entry});

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {

  final entryController = TextEditingController();

  @override
  void dispose() {
    entryController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final entryProvider = Provider.of<EntryProvider>(context,listen: false);
    if (widget.entry != null){
      //Edit
      entryController.text = widget.entry.entry;

      entryProvider.loadAll(widget.entry);
    } else {
      //Add
      entryProvider.loadAll(null);
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(formatDate(entryProvider.date, [MM, ' ', d, ', ', yyyy]))
          ,actions: [
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: (){
                _pickDate(context,entryProvider).then((value) {
                  if (value != null){
                    entryProvider.changeDate = value;
                  }
                });
              },
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Daily Entry', border: InputBorder.none,
              ),
              maxLines: 12,
              minLines: 10,
              onChanged: (String value) => entryProvider.changeEntry = value,
              controller: entryController,
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Save',style: TextStyle(color: Colors.white)),
              onPressed: () {
                entryProvider.saveEntry();
                Navigator.of(context).pop();
              },
            ),
            (widget.entry != null) ? RaisedButton(
              color: Colors.red,
              child: Text('Delete',style: TextStyle(color: Colors.white)),
              onPressed: () {
                entryProvider.removeEntry(widget.entry.entryId);
                Navigator.of(context).pop();
              },
            ): Container(),
          ],
        ),
      ),
    );
  }

  Future<DateTime> _pickDate(BuildContext context, EntryProvider entryProvider) async {
    final DateTime picked = await showDatePicker(
        context: context, initialDate: entryProvider.date, firstDate: DateTime(2019),
        lastDate: DateTime(2050));

    if (picked != null) return picked;
  }
}