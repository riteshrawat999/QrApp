import 'package:flutter/material.dart';
import 'package:qr_scanner_app/constant/colors_code.dart';

Future alertDialog({
  required BuildContext context,
  required Widget title,
  required String content,
  required VoidCallback onPressed,
}) {
  final screenWidth = MediaQuery.of(context).size.width;
  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Center(
            child: title,
          ),
          content: Text(
            content,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: screenWidth * 0.048,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(width: screenWidth * 0.06),
            ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),onPressed: onPressed, child: Text("Delete",style: TextStyle(color: Colors.white))),
          ],
        ),
  );
}
