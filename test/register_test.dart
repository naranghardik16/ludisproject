// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Register/RegisterScreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(home: widget)
    );
  }

  testWidgets('Register Page Empty Fields Test', (WidgetTester tester) async {

    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Register()));

    // Enter Text in the User Name Field
    Finder userNameField = find.byKey(new Key('UserName'));
    expect(userNameField, findsOneWidget);

    // Enter Text in the Email Field
    Finder emailField = find.byKey(new Key('EmailField'));
    expect(emailField, findsOneWidget);

    // Enter Text in the Password Field
    Finder passwordField = find.byKey(new Key('PasswordField'));
    expect(passwordField, findsOneWidget);

    // Enter Text in the Re-Enter Password Field
    Finder reEnterPasswordField = find.byKey(new Key('Re-EnterPasswordField'));
    expect(reEnterPasswordField, findsOneWidget);

    // Enter Text in the Password Field
    Finder nusnetIDField = find.byKey(new Key('NUSNET ID'));
    expect(nusnetIDField, findsOneWidget);

    // Tap on the Register Button
    Finder registerButton = find.byKey(new Key('RegisterButton'));
    await tester.tap(registerButton);

    await tester.pump();

    Finder userNameError = find.text('Please enter your Username');
    expect(userNameError, findsOneWidget);

    Finder emailFieldError = find.text('Please enter your Email Address');
    expect(emailFieldError, findsOneWidget);

    Finder passwordFieldError = find.text('Please enter your Password');
    expect(passwordFieldError, findsOneWidget);

    Finder reEnterPasswordFieldError = find.text('Please re-enter your Password');
    expect(reEnterPasswordFieldError, findsOneWidget);

    Finder nusnetIDFieldError = find.text('Please enter your NUSNET ID');
    expect(nusnetIDFieldError, findsOneWidget);

    print("Register Page Empty Fields Test --> Completed");
  });

  testWidgets('Register Page Incorrect Username, Incorrect Email, Short Password, Different Confirmation Password and Incorrect NUSNET ID Test', (WidgetTester tester) async {

    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Register()));

    // Enter Text in the User Name Field
    Finder userNameField = find.byKey(new Key('UserName'));
    expect(userNameField, findsOneWidget);
    await tester.enterText(userNameField, "SID");

    // Enter Text in the Email Field
    Finder emailField = find.byKey(new Key('EmailField'));
    expect(emailField, findsOneWidget);
    await tester.enterText(emailField, "siddharth.srivastava.2024gmail.com");

    // Enter Text in the Password Field
    Finder passwordField = find.byKey(new Key('PasswordField'));
    expect(passwordField, findsOneWidget);
    await tester.enterText(passwordField, "sidd123");

    // Enter Text in the Re-Enter Password Field
    Finder reEnterPasswordField = find.byKey(new Key('Re-EnterPasswordField'));
    expect(reEnterPasswordField, findsOneWidget);
    await tester.enterText(reEnterPasswordField, "siddharth1234");

    // Enter Text in the Password Field
    Finder nusnetIDField = find.byKey(new Key('NUSNET ID'));
    expect(nusnetIDField, findsOneWidget);
    await tester.enterText(nusnetIDField, "s0638874");

    // Tap on the Register Button
    Finder registerButton = find.byKey(new Key('RegisterButton'));
    await tester.tap(registerButton);

    await tester.pump();

    Finder userNameError = find.text('Username must be at least 4 characters in length');
    expect(userNameError, findsOneWidget);

    Finder emailFieldError = find.text('Please enter a valid Email Address');
    expect(emailFieldError, findsOneWidget);

    Finder passwordFieldError = find.text('Password must be at least 8 characters in length');
    expect(passwordFieldError, findsOneWidget);

    Finder reEnterPasswordFieldError = find.text('Confirmation password does not match the entered password');
    expect(reEnterPasswordFieldError, findsOneWidget);

    Finder nusnetIDFieldError = find.text('Please enter a valid NUSNET ID');
    expect(nusnetIDFieldError, findsOneWidget);

    print("Register Page Incorrect Username, Incorrect Email, Short Password, Different Confirmation Password and Incorrect NUSNET ID Test --> Completed");
  });

  testWidgets('Register Page Correct Username, Email, Password, Confirm Password and NUSNET ID Test', (WidgetTester tester) async {

    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Register()));

    // Enter Text in the User Name Field
    Finder userNameField = find.byKey(new Key('UserName'));
    expect(userNameField, findsOneWidget);
    await tester.enterText(userNameField, "Siddharth");

    // Enter Text in the Email Field
    Finder emailField = find.byKey(new Key('EmailField'));
    expect(emailField, findsOneWidget);
    await tester.enterText(emailField, "siddharth.srivastava.2024@gmail.com");


    // Enter Text in the Password Field
    Finder passwordField = find.byKey(new Key('PasswordField'));
    expect(passwordField, findsOneWidget);
    await tester.enterText(passwordField, "test1234");

    // Enter Text in the Re-Enter Password Field
    Finder reEnterPasswordField = find.byKey(new Key('Re-EnterPasswordField'));
    expect(reEnterPasswordField, findsOneWidget);
    await tester.enterText(reEnterPasswordField, "test1234");

    // Enter Text in the Password Field
    Finder nusnetIDField = find.byKey(new Key('NUSNET ID'));
    expect(nusnetIDField, findsOneWidget);
    await tester.enterText(nusnetIDField, "e0638874");


    // Tap on the Register Button
    Finder registerButton = find.byKey(new Key('RegisterButton'));
    await tester.tap(registerButton);

    await tester.pump();

    print("Register Page Correct Username, Email, Password, Confirm Password and NUSNET ID Test --> Completed");
  });
}