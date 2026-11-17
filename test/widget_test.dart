import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wisata_candi/main.dart';

void main() {
  testWidgets('menampilkan status awal dan merespons tap', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.text('Belum ada aksi'), findsOneWidget);
    await tester.tap(find.text('Aksi'));
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Pengguna melakukan Tap'), findsOneWidget);
  });

  testWidgets('merespons long press', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    await tester.longPress(find.text('Aksi'));
    await tester.pump();

    expect(find.text('Pengguna melakukan Long Press'), findsOneWidget);
  });

  testWidgets('merespons double tap', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    await tester.doubleTap(find.text('Aksi'));
    await tester.pump();

    expect(find.text('Pengguna melakukan Double Tap'), findsOneWidget);
  });
}
