import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:qr_scanner_app/bloc/scanner/scanner_bloc.dart';
import 'package:qr_scanner_app/constant/colors_code.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'QR & Barcode',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontWeight: FontWeight.w500,
              fontSize: 23.0,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              LucideIcons.circle_help,
              size: 25.0,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.04,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                context.read<ScannerBloc>().add(BarcodeReset());
                Navigator.pushNamed(context, '/mobile_scanner');
              },
              child: Container(
                width: screenWidth * 0.45,
                height: screenHeight * 0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppColors.buttonColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        LucideIcons.camera,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      SizedBox(height: screenHeight * 0.024),
                      const Text(
                        'Scanner',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        'Scan Code from Camera',
                        style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 11.3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: screenWidth * 0.45,
              height: screenHeight * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: AppColors.scanImageColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      LucideIcons.image,
                      size: 35.0,
                      color: Colors.white,
                    ),
                    SizedBox(height: screenHeight * 0.024),
                    const Text(
                      'Scan Image',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Scan Code from Camera',
                      style: TextStyle(
                        color: Colors.grey.shade100,
                        fontSize: 11.3,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
