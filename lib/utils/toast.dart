import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class Toast {
  static void showSuccess({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      fontSize: 13.0,
    );
  }

  static void showError({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.redAccent.shade200,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      fontSize: 13.0,
    );
  }
}
