import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/booking.dart';
import 'package:flutter_firebase_login/Screens/facilities_directory.dart';
import 'package:flutter_firebase_login/Screens/profile.dart';
import 'package:flutter_firebase_login/Screens/review.dart';

class Homepage extends StatefulWidget {
  // const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  int _index = 0;
  List _pages = [Profile(), Review(), FacilitiesDirectory(), Bookings()];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.purple,
        showUnselectedLabels: true,
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.orangeAccent,
            icon: Icon(
              Icons.verified_user,
              color: Colors.yellow,
            ),
            label: "Profile",
            activeIcon: Icon(
              Icons.verified_user,
              color: Colors.purple,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orangeAccent,
            icon: Icon(
              Icons.reviews,
              color: Colors.yellow,
            ),
            label: "Review",
            activeIcon: Icon(
              Icons.reviews,
              color: Colors.purple,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orangeAccent,
            icon: Icon(
              Icons.folder,
              color: Colors.yellow,
            ),
            label: "Facilities Directory",
            activeIcon: Icon(
              Icons.folder,
              color: Colors.purple,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orangeAccent,
            icon: Icon(
              Icons.book,
              color: Colors.yellow,
            ),
            label: "Bookings",
            activeIcon: Icon(
              Icons.book,
              color: Colors.purple,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }

// Widget build(BuildContext context) {
//   return Scaffold(
//       backgroundColor: Colors.orangeAccent,
//       appBar: AppBar(
//           backgroundColor: Colors.blue[400],
//           centerTitle: true,
//           title: Text("Dashboard",
//               style: TextStyle(fontSize: 30, color: Colors.white)),
//           leading: Icon(
//             Icons.menu,
//           ),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(
//                 Icons.settings,
//                 color: Colors.white,
//               ),
//               onPressed: () {},
//             )
//           ]),
//       body: Center(
//           child: Column(children: [
//         Padding(
//           padding: EdgeInsets.fromLTRB(15, 170, 15, 15),
//           child: SizedBox(
//             width: 200.0,
//             height: 40.0,
//             child: ElevatedButton(
//               child: new Text("Add New Bookings"),
//               style: ButtonStyle(
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(18.0),
//               ))),
//               onPressed: () {},
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(15, 00, 15, 150),
//           child: SizedBox(
//             width: 200.0,
//             height: 40.0,
//             child: ElevatedButton(
//               child: new Text("Review Bookings"),
//               style: ButtonStyle(
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(18.0),
//               ))),
//               onPressed: () {},
//             ),
//           ),
//         ),
//         Padding(
//             padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
//             child: SizedBox(
//               width: 100.0,
//               height: 40.0,
//               child: ElevatedButton(
//                 child: new Text("Sign out"),
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.blue),
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18.0),
//                     ))),
//                 onPressed: () async {
//                   await FirebaseAuth.instance.signOut();
//                 },
//               ),
//             )),
//       ])));

//   child: ElevatedButton(
//     style: ButtonStyle(
//         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//             RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(18.0),
//                 side: BorderSide(color: Colors.blue)))),
//     onPressed: () async {
//       await FirebaseAuth.instance.signOut();
//     },
//     child: Text("Sign Out"),
//   ),
// ),
// body: Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: ElevatedButton(
//         style: ButtonStyle(
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18.0),
//                     side: BorderSide(color: Colors.blue)))),
//         onPressed: () {
//         },
//         child: Text("Add New Bookings"),
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: ElevatedButton(
//         style: ButtonStyle(
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18.0),
//                     side: BorderSide(color: Colors.blue)))),
//         onPressed: () {
//         },
//         child: Text("Sign Out"),
//       ),
//     ),
//
//   ]
// )
// );

}
