// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_login/Screens/BookingPage/bookingpage.dart';
// import 'package:flutter_firebase_login/src/Screens/BookingScreen.dart';
// import 'package:flutter_firebase_login/src/Screens/review.dart';
//
// class FacilitiesDirectory extends StatefulWidget {
//   @override
//   _FacilitiesDirectoryState createState() => _FacilitiesDirectoryState();
// }
//
// class _FacilitiesDirectoryState extends State<FacilitiesDirectory> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(95, 106, 228, 1),
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(237, 148, 99, 1),
//         centerTitle: true,
//           automaticallyImplyLeading: false,
//           title: Text(
//             'Facilities Directory',
//             style: TextStyle(
//               fontFamily: 'poppins-regular', fontWeight: FontWeight.w500
//             ),
//           ),
//
//       ),
//       body: pgpr(),
//     );
//   }
//   // Widget build(BuildContext context) {
//   //   return DefaultTabController(
//   //       length: 2,
//   //       child: Scaffold(
//   //           backgroundColor: Colors.orangeAccent,
//   //           appBar: AppBar(
//   //             backgroundColor: Colors.blue,
//   //             centerTitle: true,
//   //             automaticallyImplyLeading: false,
//   //             bottom: new TabBar(
//   //               indicatorColor: Colors.orangeAccent,
//   //               tabs: <Widget>[
//   //                 new Tab(text: "PGP Residences"),
//   //                 new Tab(text: "PGP House"),
//   //               ],
//   //             ),
//   //             title: Text(
//   //               'Facilities Directory',
//   //               style: TextStyle(
//   //                   fontFamily: 'poppins-regular', fontWeight: FontWeight.w500),
//   //             ),
//   //           ),
//   //           body: TabBarView(
//   //             children: <Widget>[pgpr(), pgph()],
//   //           )));
//   // }
//
//   Widget pgpr() {
//     return ListView(
//       children: <Widget>[
//         itemCard('Auditorium', 'assets/images/auditorium.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//         itemCard('Badminton', 'assets/images/badminton_court.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//         itemCard('Basketball', 'assets/images/basketball_court.jpeg',
//             false, "27 Prince George's Park", '8AM-10PM'),
//         itemCard('Music Room', 'assets/images/music_room.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//         itemCard('Reading Room', 'assets/images/reading_room.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//         itemCard('Table Tennis', 'assets/images/table_tennis.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//         itemCard('Tennis', 'assets/images/tennis_court.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//         itemCard('TV Room', 'assets/images/tv_room.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//         itemCard('Student Lounge', 'assets/images/student_lounge.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//
//       ],
//     );
//   }
//
//   Widget pgph() {
//     return ListView(
//       children: <Widget>[
//         itemCard('Auditorium', 'assets/images/auditorium.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//         itemCard('Badminton court', 'assets/images/badminton_court.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//         itemCard('Basketball court', 'assets/images/basketball_court.jpeg',
//             false, "27 Prince George's Park", '8AM-10PM'),
//         itemCard('Reading Room', 'assets/images/reading_room.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//         itemCard('Table Tennis', 'assets/images/table_tennis.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//         itemCard('Lawn Tennis', 'assets/images/tennis_court.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//         itemCard('Student Lounge', 'assets/images/student_lounge.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//         itemCard('TV Room', 'assets/images/tv_room.jpeg', false,
//             "27 Prince George's Park", '8AM-10PM'),
//       ],
//     );
//   }
//
//   Widget itemCard(String title, String imgPath, bool isFavorite, String address,
//       String timings) {
//     return Padding(
//       padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
//       child: Container(
//         height: 120.0,
//         width: double.infinity,
//         //color: Colors.white,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             color: Colors.white),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Container(
//               width: 140.0,
//               height: 160.0,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4)),
//                   image: DecorationImage(
//                       image: AssetImage(imgPath), fit: BoxFit.cover)),
//             ),
//             SizedBox(width: 4.0),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       title,
//                       style: TextStyle(
//                           fontFamily: 'Quicksand',
//                           fontSize: 17.0,
//                           color: Colors.black87,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5.0),
//                     Container(
//                       width: 175.0,
//                       child: Text(
//                         address,
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                             fontFamily: 'Quicksand',
//                             color: Colors.grey,
//                             fontSize: 12.0),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       timings,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontFamily: 'Quicksand',
//                           color: Colors.grey,
//                           fontSize: 12.0),
//                     )
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Container(
//                         child: FloatingActionButton(
//                       child: Icon(Icons.add),
//                       splashColor: Colors.red,
//                       backgroundColor: Color.fromRGBO(95, 106, 228, 1),
//                       foregroundColor: Colors.white,
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => BookingPage()));
//                       },
//                       mini: true,
//                     )),
//                     SizedBox(width: 35.0),
//                     Container(
//                       child: TextButton(
//                         style: TextButton.styleFrom(
//                             backgroundColor: Color.fromRGBO(237, 148, 99, 1),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30.0))),
//                         // color: Colors.teal,
//                         onPressed: () {},
//                         // textColor: Colors.white,
//                         child: Text(
//                           'DETAILS',
//                           style: TextStyle(
//                               fontFamily: 'Quicksand',
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
