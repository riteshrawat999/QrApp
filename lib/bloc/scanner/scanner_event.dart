part of 'scanner_bloc.dart';

sealed class ScannerEvent {}

class ScannerDetectedEvent extends ScannerEvent {
  final String barcode;
  ScannerDetectedEvent(this.barcode);
}

class ScannerToggleFlashEvent extends ScannerEvent {}

class ScannerSwitchCameraEvent extends ScannerEvent {}

class BarcodeScanned extends ScannerEvent {
  final String barcode;
  final dynamic format;
  BarcodeScanned(this.barcode,this.format);
}

class BarcodeReset extends ScannerEvent {}
