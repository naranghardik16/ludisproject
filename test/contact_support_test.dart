// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/ContactSupport/ContactSupport.dart';
import 'package:flutter_test/flutter_test.dart';


void main() async {

  Widget buildTestableWidget(Widget widget) {
    return new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(home: widget)
    );
  }

  testWidgets('Contact Support Test', (WidgetTester tester) async {
    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(ContactSupport()));

    // Check Customer Service Enquiries Text
    Finder customerServiceEnquiriesText = find.byKey(new Key('Customer Service Enquiries'));
    expect(customerServiceEnquiriesText, findsOneWidget);

    // Check Details Text
    Finder detailsText = find.byKey(new Key('Details'));
    expect(detailsText, findsOneWidget);

    // Check Contact Details Text
    Finder contactDetailsText = find.byKey(new Key('Contact Details'));
    expect(contactDetailsText, findsOneWidget);

    print("Contact Support Test --> Completed");
  });
}