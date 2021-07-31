import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tensorflow_lite_flutter/HomePage.dart';

void main() {
  testWidgets('HomePage Widget Test', (WidgetTester tester) async {
    // Find Widgets on the Screen byKey.
    final imagePickerContainer = find.byKey(ValueKey('imageContainer'));
    final imagePickerButton = find.byKey(ValueKey('uploadButton'));
    final cameraButton = find.byKey(ValueKey('camereButton'));
    final helpIcon = find.byKey(ValueKey('helpIcon'));

    // Pump the widget.
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    // check outputs.
    expect(helpIcon, findsOneWidget);
    expect(imagePickerContainer, findsOneWidget);
    expect(imagePickerButton, findsOneWidget);
    expect(cameraButton, findsOneWidget);
  });
}
