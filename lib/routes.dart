import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_login/Screens/profile/profile_screen.dart';

// We use name route
// All our routes will be available here

final Map<String, WidgetBuilder> routes = {
  ProfileScreen.routeName: (context) => ProfileScreen(),
};