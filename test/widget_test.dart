import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:itemtris/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(AppBar), findsNothing);
    expect(find.text('Itemtris'), findsOneWidget);
  });
}
