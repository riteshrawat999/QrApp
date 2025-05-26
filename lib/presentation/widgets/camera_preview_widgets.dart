import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../bloc/scanner/scanner_bloc.dart';

class CameraPreviewWidgets extends StatelessWidget {
  final MobileScannerController controller;
  const CameraPreviewWidgets({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: controller,
      onDetect:(capture) => _handleDetection(context,capture)
    );
  }
  void _handleDetection (BuildContext context,BarcodeCapture capture){
    final List<Barcode> barcodes = capture.barcodes;
    final format = capture.barcodes.first.format;
    if (barcodes.isNotEmpty &&
        barcodes.first.rawValue != null) {
       context.read<ScannerBloc>().add(
        ScannerDetectedEvent(
          barcodes.first.rawValue.toString(),
        ),
      );
      context.read<ScannerBloc>().add(
        BarcodeScanned(barcodes.first.rawValue!,format),
      );
    }
    HapticFeedback.lightImpact();
  }
}
