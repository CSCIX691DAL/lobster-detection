import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lobster_detection/HomePage/SplashScreen.dart';

void main() {
  // Test for Text Widgets on SplashPage.
  testWidgets('Test TextWidget on Splash Screen', (WidgetTester tester) async {
    // final summaryText = find.byKey(ValueKey('summaryText'));

    await tester.pumpWidget(MaterialApp(home: splashPage()));

    // await tester.pump();
    expect(find.text('Welcome to \nLobster Detection'), findsOneWidget);
    expect(
        find.text(
            'This app makes use of Machine Learning to recognize Lobsters.'),
        findsOneWidget);
  });
}
