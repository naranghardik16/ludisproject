// @dart=2.9
import 'package:flutter_firebase_login/Screens/Login/LoginScreen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
String userId;

bool didRequestSignIn = false;
bool didRequestCreateUser = false;
bool didRequestLogout = false;

Future<String> signIn(String email, String password) async {
  didRequestSignIn = true;
  return _userIdOrError();
}

Future<String> createUser(String email, String password) async {
  didRequestCreateUser = true;
  return _userIdOrError();
}

Future<String> currentUser() async {
  return _userIdOrError();
}

Future<void> signOut() async {
  didRequestLogout = true;
  return Future.value();
}

Future<String> _userIdOrError() {
  if (userId != null) {
    return Future.value(userId);
  } else {
    throw StateError('No user');
  }
}

void main() {

  Widget createWidgetForTesting({Widget child}){
    return MaterialApp(
      home: child,
    );
  }

  testWidgets("Empty Fields and click on login", (WidgetTester tester)
  async {
    await tester.pumpWidget(createWidgetForTesting(child: new Login()));
    Finder emailField  = find.byKey(new Key("Email"));
    await tester.enterText(emailField , "");

    Finder passwordField = find.byKey(new Key('Password'));
    await tester.enterText(passwordField, "");

    Finder loginButton = find.byKey(new Key("LoginButton"));
    await tester.tap(loginButton);

    await tester.pump();

    expect(didRequestSignIn, false);
  });

  testWidgets("Email Incorrect, Password Correct and click on login", (WidgetTester tester)
  async {
    await tester.pumpWidget(createWidgetForTesting(child: new Login()));
    Finder emailField  = find.byKey(new Key("Email"));
    await tester.enterText(emailField , "sid");

    Finder passwordField = find.byKey(new Key('Password'));
    await tester.enterText(passwordField, "test1234");

    Finder loginButton = find.byKey(new Key("LoginButton"));
    await tester.tap(loginButton);

    await tester.pump();

    expect(didRequestSignIn, false);
  });

  testWidgets("Empty Fields and click on login", (WidgetTester tester)
  async {
    await tester.pumpWidget(createWidgetForTesting(child: new Login()));
    Finder emailField  = find.byKey(new Key("Email"));
    await tester.enterText(emailField , "siddharth@sixergame.com");

    Finder passwordField = find.byKey(new Key('Password'));
    await tester.enterText(passwordField, "test1234");

    Finder loginButton = find.byKey(new Key("LoginButton"));
    await tester.tap(loginButton);

    await tester.pump();

    expect(didRequestSignIn, true);
  });

  testWidgets("Empty Fields and click on login", (WidgetTester tester)
  async {
    await tester.pumpWidget(createWidgetForTesting(child: new Login()));
    Finder emailField  = find.byKey(new Key("Email"));
    await tester.enterText(emailField , "");

    Finder passwordField = find.byKey(new Key('Password'));
    await tester.enterText(passwordField, "");

    Finder loginButton = find.byKey(new Key("LoginButton"));
    await tester.tap(loginButton);

    await tester.pump();

    expect(didRequestSignIn, false);
  });

  testWidgets("Empty Fields and click on login", (WidgetTester tester)
  async {
    await tester.pumpWidget(createWidgetForTesting(child: new Login()));
    Finder emailField  = find.byKey(new Key("Email"));
    await tester.enterText(emailField , "");

    Finder passwordField = find.byKey(new Key('Password'));
    await tester.enterText(passwordField, "");

    Finder loginButton = find.byKey(new Key("LoginButton"));
    await tester.tap(loginButton);

    await tester.pump();

    expect(didRequestSignIn, false);
  });

}