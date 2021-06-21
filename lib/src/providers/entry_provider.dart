// @dart=2.9
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_firebase_login/src/models/entry.dart';
// import 'package:flutter_firebase_login/src/services/firestore_service.dart';
// import 'package:uuid/uuid.dart';
// import 'package:provider/provider.dart';
//
// class EntryProvider with ChangeNotifier {
//   final firestoreService = FirestoreService();
//   DateTime _date;
//   String _entry;
//   String _entryId;
//   var uuid = Uuid();
//
//   //Getters
//   DateTime get date => _date;
//
//   String get entry => _entry;
//
//   Stream<List<Entry>> get entries => firestoreService.getEntries();
//
//   //Setters
//   set changeDate(DateTime date) {
//     _date = date;
//     notifyListeners();
//   }
//
//   set changeEntry(String entry) {
//     _entry = entry;
//     notifyListeners();
//   }
//
//   //Functions
//   loadAll(Entry entry) {
//     // ignore: unnecessary_null_comparison
//     if (entry != null) {
//       _date = DateTime.parse(entry.date);
//       _entry = entry.entry;
//       _entryId = entry.entryId;
//     } else {
//       _date = DateTime.now();
//       _entry = null;
//       _entryId = null;
//     }
//   }
//
//   saveEntry() {
//     if (_entryId == null) {
//       //Add
//       var newEntry = Entry(
//           date: _date.toIso8601String(), entry: _entry, entryId: uuid.v1());
//       firestoreService.setEntry(newEntry);
//     } else {
//       //Edit
//       var updatedEntry = Entry(
//           date: _date.toIso8601String(), entry: _entry, entryId: _entryId);
//       firestoreService.setEntry(updatedEntry);
//     }
//   }
//
//   removeEntry(String entryId) {
//     _entry = entry;
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/models/entry.dart';
import 'package:flutter_firebase_login/src/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class EntryProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  DateTime _date;
  String _entry;
  String _entryId;
  var uuid = Uuid();

  //Getters
  DateTime get date => _date;
  String get entry => _entry;
  Stream<List<Entry>> get entries => firestoreService.getEntries();

  //Setters
  set changeDate(DateTime date){
    _date = date;
    notifyListeners();
  }

  set changeEntry(String entry){
    _entry = entry;
    notifyListeners();
  }

  //Functions
  loadAll(Entry entry){
    if (entry != null){
      _date = DateTime.parse(entry.date);
      _entry =entry.entry;
      _entryId = entry.entryId;
    } else {
      _date = DateTime.now();
      _entry = null;
      _entryId = null;
    }
  }

  saveEntry(){
    if (_entryId == null){
      //Add
      var newEntry = Entry(date: _date.toIso8601String(), entry: _entry, entryId: uuid.v1());
      print(newEntry.entry);
      firestoreService.setEntry(newEntry);
    } else {
      //Edit
      var updatedEntry = Entry(date: _date.toIso8601String(), entry: _entry, entryId: _entryId);
      firestoreService.setEntry(updatedEntry);
    }
  }

  removeEntry(String entryId){
    firestoreService.removeEntry(entryId);
  }

}
