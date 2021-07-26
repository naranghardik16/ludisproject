// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Help/Help.dart';
import 'package:flutter_firebase_login/Screens/Profile/profile.dart';
import 'package:flutter_test/flutter_test.dart';


void main() async {

  Widget buildTestableWidget(Widget widget) {
    return new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: widget)
    );
  }

  testWidgets('Profile Test: Change Password Button', (WidgetTester tester) async {
    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Profile()));

    // Tap on the Change Password Button
    Finder changePasswordButton = find.byKey(new Key('Change Password'));
    await tester.tap(changePasswordButton);

    // 'pump' the tester again. This causes the widget to rebuild
    await tester.pump();

    Finder emailField = find.byKey(new Key('EmailField'));
    expect(emailField, findsOneWidget);
    await tester.enterText(emailField, 'test@gmail.com');

    Finder sendResetEmailButton = find.byKey(new Key('Send Reset Email'));
    expect(sendResetEmailButton, findsOneWidget);

    await tester.pump();

    Finder emailFieldInput = find.text('test@gmail.com');
    expect(emailFieldInput, findsOneWidget);

    tester.tap(sendResetEmailButton);

    print("Profile Test: Change Password Button --> Completed");
  });

  testWidgets('Profile Test: Help Center Button', (WidgetTester tester) async {

    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Profile()));

    // Tap on the Change Password Button
    Finder helpCenterButton = find.byKey(new Key('Help Center'));
    await tester.tap(helpCenterButton);

    // 'pump' the tester again. This causes the widget to rebuild
    await tester.pumpAndSettle();
    expect(find.byType(Help), findsOneWidget);

    print("Profile Test: Help Center Button --> Completed");
  });

  testWidgets('Profile Test: Log Out Button', (WidgetTester tester) async {

    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Profile()));

    // Tap on the Change Password Button
    Finder logOutButton = find.byKey(new Key('Log Out'));
    await tester.tap(logOutButton);

    // 'pump' the tester again. This causes the widget to rebuild
    await tester.pump();

    Finder logOutButtonDialogue = find.byKey(new Key('Log Out Button'));
    expect(logOutButtonDialogue, findsOneWidget);

    Finder cancelButton = find.byKey(new Key('Cancel Button'));
    expect(cancelButton, findsOneWidget);

    print("Profile Test: Help Center Button --> Completed");
  });
}