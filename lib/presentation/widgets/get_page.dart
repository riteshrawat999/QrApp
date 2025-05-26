import 'package:flutter/material.dart';
import 'package:qr_scanner_app/presentation/screens/generator_screen.dart';
import 'package:qr_scanner_app/presentation/screens/history_screen.dart';
import 'package:qr_scanner_app/presentation/screens/scan_screen.dart';
import 'package:qr_scanner_app/presentation/screens/setting_screen.dart';

Widget getPage(int index) {
  switch (index) {
    case 0:
      return ScanScreen();
    case 1:
      return GeneratorScreen();
    case 2:
      return HistoryScreen();
    case 3:
      return SettingScreen();
    default:
      return const Center(child: Text("404"));
  }
}
