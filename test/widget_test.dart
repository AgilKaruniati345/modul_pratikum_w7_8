// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modul_pratikum_w7_8/main.dart';

void main() {
  testWidgets('MediaJournalApp smoke test', (WidgetTester tester) async {
    // Bangun (render) aplikasi utama
    await tester.pumpWidget(const MediaJournalApp());

    // Pastikan tampilan awal adalah halaman Catatan & File I/O
    expect(find.text('Catatan & File I/O'), findsOneWidget);

    // Cek tombol Simpan dan Muat muncul di mode catatan
    expect(find.text('Simpan'), findsOneWidget);
    expect(find.text('Muat'), findsOneWidget);

    // Buka menu popup (tiga titik di AppBar)
    await tester.tap(find.byType(PopupMenuButton<PageMode>));
    await tester.pumpAndSettle();

    // Pilih menu Kamera
    await tester.tap(find.text('Kamera'));
    await tester.pumpAndSettle();

    // Pastikan judul berubah jadi mode Kamera
    expect(find.text('Kamera (Picker) & AnimatedSwitcher'), findsOneWidget);

    // Buka menu lagi untuk ganti ke Video
    await tester.tap(find.byType(PopupMenuButton<PageMode>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Video'));
    await tester.pumpAndSettle();

    // Pastikan judul berubah jadi mode Video
    expect(find.text('Media Player (Video)'), findsOneWidget);
  });
}
