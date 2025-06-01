import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_app/bloc/scanner/scanner_bloc.dart';
import 'package:qr_scanner_app/bloc/theme/theme_bloc.dart';
import 'package:qr_scanner_app/constant/colors_code.dart';
import 'package:qr_scanner_app/models/scanned_history_model.dart';
import 'package:qr_scanner_app/presentation/widgets/camera_preview_widgets.dart';
import 'package:qr_scanner_app/presentation/widgets/camera_switch_button.dart';
import 'package:qr_scanner_app/presentation/widgets/flash_toggle_button.dart';
import 'package:qr_scanner_app/presentation/widgets/scanner_dismis.dart';
import 'package:qr_scanner_app/services/db_services.dart';
import 'package:qr_scanner_app/utils/open_link.dart';

class MobilScannerScreen extends StatefulWidget {
  const MobilScannerScreen({super.key});

  @override
  State<MobilScannerScreen> createState() => _MobilScannerScreenState();
}

class _MobilScannerScreenState extends State<MobilScannerScreen> {
  MobileScannerController cameraController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    returnImage: true,
  );

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR & Barcode Scanner'),
        leading: ScannerDismis(),
        actions: [
          FlashToggleButton(controller: cameraController),
          CameraSwitchButton(controller: cameraController),
        ],
      ),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return BlocBuilder<ScannerBloc, ScannerState>(
            builder: (context, scannerState) {
              if (scannerState is ScannerSuccess) {
                return Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          scannerState.barcode,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 34, 13, 214),
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        launchedScannerUrl(scannerState.barcode, context);
                      },
                      icon: Icon(
                        LucideIcons.external_link, // link open icon
                        size: screenWidth * 0.06,
                        color: Color.fromARGB(255, 34, 13, 214),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        DBHelper.insertScannedHistory(
                          context: context,
                          data: ScannedHistoryModel(
                            barcode: scannerState.barcode,
                            format:
                                scannerState.format.toString().split('.').last,
                            timeStamp: DateTime.now().toIso8601String(),
                            isFavorite: 0,
                          ),
                        );
                      },
                      icon: Icon(
                        LucideIcons.save,
                        color: AppColors.buttonColor,
                        blendMode: BlendMode.darken,
                      ),
                    ),
                  ],
                );
              }
              return Stack(
                children: [
                  // 1. Mobile Scanner for camera preview
                  Positioned.fill(
                    child: CameraPreviewWidgets(controller: cameraController),
                  ),
                  // 2. Overlay with dimmed areas and transparent scan window
                  // This create darker area around the scanning box.
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6),
                      BlendMode.srcOut,
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: screenWidth * 0.6,
                              height: screenHeight * 0.3,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Container(color: Colors.black12),
                        ),
                      ],
                    ),
                  ),
                  // 4. Top Bar
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
