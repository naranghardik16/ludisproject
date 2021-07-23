import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Home/homepage.dart';
import 'package:flutter_firebase_login/Screens/Login2/LoginScreen.dart';
import 'package:flutter_firebase_login/Screens/Opening/OpeningScreen.dart';
import 'package:flutter_firebase_login/Screens/Register/RegisterScreen.dart';

class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-login';
  static const String authRegister = '/auth-register';
  static const String home = '/menu';
  static const String root = '/root';

  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => Login(),
      authRegister: (context) => Register(),
      home: (context) => Homepage(),
      root: (context) => OpeningView()
    };
  }
}
