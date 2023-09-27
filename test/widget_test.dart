// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gametimer/main.dart';

void main() {
  testWidgets('Timer start and decrement smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    var player1Key = const Key("player1");

    // Verify that our counter starts at 0.
    expect(find.text('10:00'), findsNWidgets(2));

    // Tap player1 to active player and trigger a frame update.
    await tester.tap(find.byKey(player1Key));
    await tester.pump();

    expect(find.text('10:00'), findsOneWidget);
    expect(find.text('9:59'), findsOneWidget);

    await tester.tap(find.byKey(player1Key));
    await tester.pump();

    // Verify that our counter starts at 0.
    expect(find.text('9:59'), findsNWidgets(2));
  });
}
