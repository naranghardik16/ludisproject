// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Login/login.dart';
import 'package:flutter_firebase_login/Screens/Opening/OpeningScreen.dart';
import 'package:flutter_firebase_login/Screens/Register/RegisterScreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(home: widget)
    );
  }

  testWidgets('Opening View Test Login Button', (WidgetTester tester) async {

    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(OpeningView()));

    // Tap on the Login Button
    Finder loginButton = find.byKey(new Key('LoginButton'));
    await tester.tap(loginButton);

    // 'pump' the tester again. This causes the widget to rebuild
    await tester.pumpAndSettle();
    expect(find.byType(Login), findsOneWidget);

    print("Opening View Test Login Button --> Completed");
  });

  testWidgets('Opening View Test Register Button', (WidgetTester tester) async {

    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(OpeningView()));

    // Tap on the Register Button
    Finder registerButton = find.byKey(new Key('RegisterButton'));
    await tester.tap(registerButton);

    // 'pump' the tester again. This causes the widget to rebuild
    await tester.pumpAndSettle();
    expect(find.byType(Register), findsOneWidget);

    print("Opening View Test Register Button --> Completed");
  });
}