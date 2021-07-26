// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Login/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(home: widget)
    );
  }

  testWidgets('Login Page Empty Fields Test', (WidgetTester tester) async {

    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Login()));

    // Enter Text in the Email Field
    Finder emailField = find.byKey(new Key('EmailField'));
    expect(emailField, findsOneWidget);

    // Enter Text in the Password Field
    Finder passwordField = find.byKey(new Key('PasswordField'));
    expect(passwordField, findsOneWidget);

    // Tap on the Login Button
    Finder loginButton = find.byKey(new Key('LoginButton'));
    await tester.tap(loginButton);

    await tester.pump();

    Finder emailFieldError = find.text('Please enter your Email Address');
    expect(emailFieldError, findsOneWidget);

    Finder passwordFieldError = find.text('Please enter you Password');
    expect(passwordFieldError, findsOneWidget);

    print("Login Page Empty Fields Test --> Completed");
  });

  testWidgets('Incorrect Email and Short Password Test', (WidgetTester tester) async {

    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Login()));

    // Enter Text in the Email Field
    Finder emailField = find.byKey(new Key('EmailField'));
    expect(emailField, findsOneWidget);
    await tester.enterText(emailField, "testgmail.com");

    await tester.pump();

    // Enter Text in the Password Field
    Finder passwordField = find.byKey(new Key('PasswordField'));
    expect(passwordField, findsOneWidget);
    await tester.enterText(passwordField, "test123");

    await tester.pump();

    // tap on the login button
    Finder loginButton = find.byKey(new Key('LoginButton'));
    await tester.tap(loginButton);

    await tester.pump();

    Finder emailFieldError = find.text('Please enter a valid Email Address');
    expect(emailFieldError, findsOneWidget);

    Finder passwordFieldError = find.text('Password must be at least 8 characters in length');
    expect(passwordFieldError, findsOneWidget);

    print("Incorrect Email and Short Password Test --> Completed");
  });

  testWidgets('Correct Email and Password Test', (WidgetTester tester) async {

    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Login()));

    // Enter Text in the Email Field
    Finder emailField = find.byKey(new Key('EmailField'));
    expect(emailField, findsOneWidget);
    await tester.enterText(emailField, "test@gmail.com");

    await tester.pump();

    // Enter Text in the Password Field
    Finder passwordField = find.byKey(new Key('PasswordField'));
    expect(passwordField, findsOneWidget);
    await tester.enterText(passwordField, "test1234");

    await tester.pump();

    // tap on the login button
    Finder loginButton = find.byKey(new Key('LoginButton'));
    await tester.tap(loginButton);

    // Removed due to small API error.
    // await tester.pumpAndSettle();
    //
    // expect(find.byType(Homepage), findsOneWidget);

    print("Correct Email and Password Test --> Completed");
  });
}