import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Home/homepage.dart';
// import 'package:flutter_firebase_login/Screens/Login_success/login_success_screen.dart';
import 'package:flutter_firebase_login/Screens/Login/loginpage.dart';
import 'package:flutter_firebase_login/Screens/Opening/OpeningScreen.dart';
import 'package:flutter_firebase_login/providers/booking_provider.dart';
import 'package:flutter_firebase_login/providers/entry_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import 'Screens/Landing/landingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider(create: (context) => BookingProvider()),
    //       ChangeNotifierProvider(create: (context) => EntryProvider())
    //     ],
    //     child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: OpeningView(),
    //     // home: LandingScreen(),
    // ),);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpeningView(),
    );
  }
}

// class LandingPage extends StatelessWidget {
//   // const LandingPage({Key key}) : super(key: key);
//
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initialization,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Scaffold(
//             body: Center(
//               child: Text("Error: ${snapshot.error}"),
//             ),
//           );
//         }
//
//         if (snapshot.connectionState == ConnectionState.done) {
//           return StreamBuilder(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.active) {
//                 Object? user = snapshot.data;
//
//                 if (user == null) {
//                   return Loginpage();
//                 } else {
//                   return Homepage();
//                 }
//               }
//
//               return Scaffold(
//                 body: Center(
//                   child: Text("Loading...."),
//                   // child: Text("Checking Authentication...."),
//                   // child: Image.asset('assets/images/abc.png'),
//                 ),
//               );
//             },
//           );
//         }
//
//         return Scaffold(
//           body: Center(
//             child: Text("Connecting to the app...."),
//             // child: Image.asset('assets/images/abc.png'),
//           ),
//         );
//       },
//     );
//   }
// }
