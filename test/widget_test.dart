// Perbaiki test dengan mengecek widget yang benar

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter'),
              Text('0', style: TextStyle(fontSize: 24)),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    ));

    // Verify initial state
    expect(find.text('0'), findsOneWidget);

    // Tap the button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify counter incremented
    expect(find.text('1'), findsOneWidget);
  });
}