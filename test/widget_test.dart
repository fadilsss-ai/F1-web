import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:f1web/main.dart';

void main() {
  testWidgets('Halaman login menampilkan judul dan tombol START ENGINE', (WidgetTester tester) async {
    // Membangun aplikasi f1web dan memicu satu frame.
    // Widget utama aplikasi ini bernama F1WebApp, bukan MyApp.
    await tester.pumpWidget(const F1WebApp());

    // Pastikan judul ajakan login muncul di layar.
    expect(find.text('RACE INTO YOUR ACCOUNT'), findsOneWidget);

    // Pastikan tombol login "START ENGINE" ada.
    expect(find.text('START ENGINE'), findsOneWidget);

    // Pastikan field username dan password tersedia.
    expect(find.byType(TextField), findsNWidgets(2));
  });
}