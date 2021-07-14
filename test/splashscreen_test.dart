import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tensorflow_lite_flutter/SplashScreen.dart';

void main() {
  // Test for Text Widgets on SplashPage.
  testWidgets('Test TextWidget on Splash Screen', (WidgetTester tester) async {
    final imageWidget = find.byKey(ValueKey('image'));

    await tester.pumpWidget(MaterialApp(home: splashPage()));

    // check outputs.
    expect(find.text('Welcome to \nLobster Detection'), findsOneWidget);
    expect(imageWidget, findsOneWidget);
    expect(
        find.text(
            'This app makes use of Machine Learning to recognize Lobsters.'),
        findsOneWidget);
  });

  //Test for Button Widget on SplashPage.
  testWidgets('Test ButtonWidget on Splash Screen',
      (WidgetTester tester) async {
    // Find Widget on Screen by Key.
    final proceedButton = find.byKey(ValueKey('proceedButton'));

    // executing tests
    await tester.pumpWidget(MaterialApp(home: splashPage()));
    await tester.tap(proceedButton);
    // Rebuild Widget to reflect any changes.
    await tester.pump();
  });
}
