// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_login/Screens/profile/profile_screen.dart';
import 'Screens/Home/homepage.dart';
// We use name route
// All our routes will be available here

final Map<String, WidgetBuilder> routes = {
  Profile.routeName: (context) => Profile(),
  Homepage.routeName: (context) => Homepage()
};

