import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_login/Screens/Settings/SettingsScreen.dart';
import 'package:flutter_firebase_login/Screens/profile/profile_screen.dart';

import 'Screens/Home/homepage.dart';
import 'Screens/LoginSuccess/login_success_screen.dart';

// We use name route
// All our routes will be available here

final Map<String, WidgetBuilder> routes = {
  ProfileScreen.routeName: (context) => ProfileScreen(),
  Homepage.routeName: (context) => Homepage(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen()
};
