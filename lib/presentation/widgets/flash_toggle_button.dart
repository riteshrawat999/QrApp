import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_app/bloc/scanner/scanner_bloc.dart';

class FlashToggleButton extends StatelessWidget {
  final MobileScannerController controller;
  const FlashToggleButton({required this.controller ,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerBloc, ScannerState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(
            state.isFlashOn
                ? LucideIcons.flashlight_off
                : LucideIcons.flashlight,
          ),
          onPressed: () {
            context.read<ScannerBloc>().add(ScannerToggleFlashEvent());
            controller.toggleTorch();
          },
        );
      },
    );
  }
}
