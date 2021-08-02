// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Help/help.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_firebase_login/Screens/AboutLudis/AboutLudis.dart';
import 'package:flutter_firebase_login/Screens/ContactSupport/ContactSupport.dart';
import 'package:flutter_firebase_login/Screens/FAQS/faqs.dart';

void main() async {

  Widget buildTestableWidget(Widget widget) {
    return new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(home: widget)
    );
  }

  testWidgets('Help Test: About Ludis Button', (WidgetTester tester) async {
    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Help()));

    // Tap on About Ludis Button
    Finder aboutLudisButton = find.byKey(new Key('About Ludis'));
    await tester.tap(aboutLudisButton);

    // 'pump' the tester again. This causes the widget to rebuild
    await tester.pumpAndSettle();

    expect(find.byType(AboutLudis), findsOneWidget);

    print("Help Test: About Ludis Button --> Completed");
  });

  testWidgets('Help Test: FAQS Button', (WidgetTester tester) async {
    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Help()));

    // Tap on FAQS Button
    Finder faqsButton = find.byKey(new Key('FAQS'));
    await tester.tap(faqsButton);

    // 'pump' the tester again. This causes the widget to rebuild
    await tester.pumpAndSettle();

    expect(find.byType(Faqs), findsOneWidget);

    print("Help Test: FAQS Button --> Completed");
  });

  testWidgets('Help Test: Contact Support Button', (WidgetTester tester) async {
    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Help()));

    // Tap on Contact Support Button
    Finder contactSupportButton = find.byKey(new Key('Contact Support'));
    await tester.tap(contactSupportButton);

    // 'pump' the tester again. This causes the widget to rebuild
    await tester.pumpAndSettle();

    expect(find.byType(ContactSupport), findsOneWidget);

    print("Help Test: Contact Support Button --> Completed");
  });
}