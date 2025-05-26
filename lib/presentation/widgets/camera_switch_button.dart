import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_app/bloc/scanner/scanner_bloc.dart';

class CameraSwitchButton extends StatelessWidget {
  final MobileScannerController controller;
  const CameraSwitchButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerBloc, ScannerState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<ScannerBloc>().add(ScannerSwitchCameraEvent());
            controller.switchCamera();
          },
          icon: Icon(
            state.isFront ? LucideIcons.camera : LucideIcons.switch_camera,
          ),
        );
      },
    );
  }
}
