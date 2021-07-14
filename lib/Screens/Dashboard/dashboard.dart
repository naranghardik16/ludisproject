// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
// class Bookings extends StatefulWidget {
//   @override
//   _BookingsState createState() => _BookingsState();
// }
//
// class _BookingsState extends State<Bookings> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text("Bookings"),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_login/models/tabs.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: Colors.orangeAccent,
        backgroundColor: Color.fromRGBO(95, 106, 228, 1),
        appBar: AppBar(
          // backgroundColor: Colors.blue,
          backgroundColor: Color.fromRGBO(237, 148, 99, 1),
          centerTitle: true,
          automaticallyImplyLeading: false,
          // leading: GestureDetector(
          //   child: Icon(Icons.arrow_back),
          //   onTap: () {
          //     Provider.of<Tabs>(context).changeIndex(0);
          //   },
          // ),
          bottom: new TabBar(
            indicatorColor: Colors.orangeAccent,
            tabs: <Widget>[
              new Tab(text: "BOOKED"),
              new Tab(text: "CANCELLED"),
            ],
          ),
          title: Text(
            'Dashboard',
            style: TextStyle(
                fontFamily: 'poppins-regular', fontWeight: FontWeight.w500),
          ),
        ),
        body: TabBarView(
          children: <Widget>[current(), cancelled()],
        ),
      ),
    );
  }

  Widget current() {
    return ListView(
      children: <Widget>[
        // itemCard('Auditorium', 'assets/images/auditorium.jpeg', false,
        //     "27 Prince George's Park", '8AM-9AM'),
        // itemCard('Badminton', 'assets/images/badminton_court.jpeg', false,
        //     "27 Prince George's Park", '2PM-3PM'),
        // itemCard('Badminton court', 'assets/images/badminton_court.jpeg', false,
        //     "27 Prince George's Park", '8AM-10PM'),
      ],
    );
  }

  Widget cancelled() {
    return ListView(
      children: <Widget>[
        itemCard('Auditorium', 'assets/images/auditorium.jpeg', false,
            "27 Prince George's Park", '8AM-9AM'),
        // itemCard('Table Tennis', 'assets/images/table_tennis.jpeg', false,
        //     "27 Prince George's Park", '9AM-10AM'),
        // itemCard('Music Room', 'assets/images/music_room.jpeg', false,
        //     "27 Prince George's Park", '8AM-10PM'),

        // itemCard('Auditorium', 'assets/images/auditorium.jpeg', false,
        //     "27 Prince George's Park", '8AM-10PM'),
        // itemCard('Badminton court', 'assets/images/badminton_court.jpeg', false,
        //     "27 Prince George's Park", '8AM-10PM'),
        // itemCard('Badminton court', 'assets/images/badminton_court.jpeg', false,
        //     "27 Prince George's Park", '8AM-10PM'),
        // itemCard('Badminton court', 'assets/images/badminton_court.jpeg', false,
        //     "27 Prince George's Park", '8AM-10PM'),
        // itemCard('Badminton court', 'assets/images/badminton_court.jpeg', false,
        //     "27 Prince George's Park", '8AM-10PM'),
        // itemCard('Badminton court', 'assets/images/badminton_court.jpeg', false,
        //     "27 Prince George's Park", '8AM-10PM'),
      ],
    );
  }
}

Widget itemCard(String title, String imgPath, bool isFavorite, String address,
    String timings) {
  return Padding(
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
    child: Container(
      height: 120.0,
      width: double.infinity,
      //color: Colors.white,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 140.0,
            height: 160.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.cover)),
          ),
          SizedBox(width: 4.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 17.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: 175.0,
                    child: Text(
                      address,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.grey,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    timings,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Colors.grey,
                        fontSize: 12.0),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: FloatingActionButton(
                        child: Icon(Icons.edit),
                        splashColor: Colors.yellow,
                        backgroundColor: Color.fromRGBO(95, 106, 228, 1),
                        foregroundColor: Colors.white,
                        onPressed: () {},
                        mini: true,
                  )),
                  SizedBox(width: 35.0),
                  Container(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                      // color: Colors.teal,
                      onPressed: () {},
                      // textColor: Colors.white,
                      child: Text(
                        'DETAILS',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
