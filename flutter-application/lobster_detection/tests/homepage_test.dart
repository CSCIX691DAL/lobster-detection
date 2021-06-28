import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lobster_detection/HomePage/HomePage.dart';

void main() {
  testWidgets('HomePage Widget Test', (WidgetTester tester) async {
    // Find Widgets on the Screen byKey.
    final imagePickerContainer = find.byKey(ValueKey('imageContainer'));
    final imagePickerButton = find.byKey(ValueKey('uploadButton'));
    final cameraButton = find.byKey(ValueKey('camereButton'));
    final helpIcon = find.byKey(ValueKey('helpIcon'));
    final flashIcon = find.byKey(ValueKey('flashIcon'));

    // Pump the widget.
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    // check outputs.
    expect(helpIcon, findsOneWidget);
    expect(flashIcon, findsOneWidget);
    expect(imagePickerContainer, findsOneWidget);
    expect(imagePickerButton, findsOneWidget);
    expect(cameraButton, findsOneWidget);
  });
}
