// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/FAQS/faqs.dart';
import 'package:flutter_test/flutter_test.dart';


void main() async {

  Widget buildTestableWidget(Widget widget) {
    return new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(home: widget)
    );
  }

  testWidgets('FAQS Test Item 1', (WidgetTester tester) async {
    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Faqs()));

    // Tap on FAQ 1 Button
    Finder displayFaq1Button = find.byKey(new Key('FAQ Short Item 1'));
    expect(displayFaq1Button, findsOneWidget);
    await tester.tap(displayFaq1Button);

    // 'pump' the tester again. This causes the widget to rebuild
    await tester.pump();

    // Check FAQ 1 Text
    Finder displayExpandedFaq1QS = find.byKey(new Key("FAQ 1 QS Text"));
    expect(displayExpandedFaq1QS, findsOneWidget);
    Finder displayExpandedFaq1ANS = find.byKey(new Key("FAQ 1 ANS Text"));
    expect(displayExpandedFaq1ANS, findsOneWidget);

    // Tap on FAQ 2 Button
    Finder displayExpandedFaq1Button = find.byKey(new Key("FAQ Expanded Item 1"));
    await tester.tap(displayExpandedFaq1Button);

    // 'pump' the tester again. This causes the widget to rebuild
    await tester.pump();

    Finder displayFaq1ButtonRepeat = find.byKey(new Key('FAQ Short Item 1'));
    expect(displayFaq1ButtonRepeat, findsOneWidget);

    print("FAQS Test Item 1 --> Completed");
  });

  testWidgets('FAQS Test Item 2', (WidgetTester tester) async {
    // Add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(Faqs()));

    // Tap on FAQ 2 Button
    Finder displayFaq2Button = find.byKey(new Key('FAQ Short Item 2'));
    expect(displayFaq2Button, findsOneWidget);
    await tester.tap(displayFaq2Button);

    // 'pump' the tester again. This causes the widget to rebuild
    await tester.pump();

    // Check FAQ 2 Text
    Finder displayExpandedFaq2QS = find.byKey(new Key("FAQ 2 QS Text"));
    expect(displayExpandedFaq2QS, findsOneWidget);
    Finder displayExpandedFaq2ANS = find.byKey(new Key("FAQ 2 ANS Text"));
    expect(displayExpandedFaq2ANS, findsOneWidget);

    // Tap on FAQ 2 Button
    Finder displayExpandedFaq2Button = find.byKey(new Key("FAQ Expanded Item 2"));
    await tester.tap(displayExpandedFaq2Button);

    // 'pump' the tester again. This causes the widget to rebuild
    await tester.pump();

    Finder displayFaq2ButtonRepeat = find.byKey(new Key('FAQ Short Item 2'));
    expect(displayFaq2ButtonRepeat, findsOneWidget);

    print("FAQS Test Item 2 --> Completed");
  });
}