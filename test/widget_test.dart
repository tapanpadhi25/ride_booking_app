import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ride_booking_app/main.dart';

void main() {
  testWidgets('Dashboard loads first', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.byIcon(Icons.list), findsOneWidget);
  });
}
