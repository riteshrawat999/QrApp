import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_app/bloc/navigation/nav_cubit.dart';
import 'package:qr_scanner_app/bloc/phone/bloc/phone_bloc.dart';
import 'package:qr_scanner_app/bloc/scanned/scanned_bloc.dart';
import 'package:qr_scanner_app/bloc/scanner/scanner_bloc.dart';
import 'package:qr_scanner_app/bloc/theme/theme_bloc.dart';
import 'package:qr_scanner_app/presentation/generator/qr_code_gen_screen.dart';
import 'package:qr_scanner_app/presentation/input_screen/contact_gen_screen.dart';
import 'package:qr_scanner_app/presentation/input_screen/phone_screen.dart';
import 'package:qr_scanner_app/presentation/screens/generator_screen.dart';
import 'package:qr_scanner_app/presentation/screens/mobil_scanner_screen.dart';

import 'package:qr_scanner_app/presentation/screens/navigation_menu.dart';

import 'bloc/contact/contact_qrcode_generate_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavCubit()),
        BlocProvider(create: (_) => ThemeBloc()..add(InitThemeEvent())),
        BlocProvider(create: (context) => ScannerBloc()),
        BlocProvider(
          create: (context) => ScannedBloc()..add(ScannedOpenEvent()),
        ),
        BlocProvider(create: (context) => ContactQrcodeGenerateBloc()),
        BlocProvider(create: (context) => PhoneBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'QR Code Scanner',
            themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            darkTheme: state.themeData,
            initialRoute: '/',
            routes: {
              '/': (context) => const NavigationMenu(),
              '/mobile_scanner': (context) => const MobilScannerScreen(),
              '/generator_screen': (context) => const GeneratorScreen(),
              '/qr_code_gen_screen': (context) => const QrCodeGenScreen(),
              '/contact_gen': (context) => const ContactGenScreen(),
              '/phone_screen': (context) => const PhoneScreen(),
            },
          );
        },
      ),
    );
  }
}
