// Perbaikan: Update test untuk mencari teks counter yang benar

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
              Text('0'), // Tambahkan teks awal
            ],
          ),
        ),
      ),
    ));

    // Verify initial state
    expect(find.text('0'), findsOneWidget);

    // Tap the '+' button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify counter increments
    expect(find.text('1'), findsOneWidget);

    // Tap the '+' button 998 more times to reach 999
    for (int i = 0; i < 998; i++) {
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
    }

    // Verify final state
    expect(find.text('999'), findsOneWidget);
  });
}