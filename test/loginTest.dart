// @dart=2.9
import 'package:flutter_firebase_login/Screens/Login2/LoginScreen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets("Empty Fields and click on login", (WidgetTester tester)
  async {
    await tester.pumpWidget(Login());
    var email = find.text("Email");

  });
}