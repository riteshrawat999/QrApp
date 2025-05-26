part of 'scanner_bloc.dart';

sealed class ScannerState extends Equatable {
  final String barcodeResult;
  final bool isFlashOn;
  final bool isFront;

  const ScannerState({
    this.barcodeResult = "Place QR or Barcode inside square.",
    this.isFlashOn = false,
    this.isFront = false,
  });
  @override
  List<Object?> get props => [barcodeResult, isFlashOn, isFront];
}

class ScannerInitial extends ScannerState {
  const ScannerInitial() : super();
  @override
  List<Object?> get props => [];
}

class ScannerUpdateState extends ScannerState {
  const ScannerUpdateState({
    required super.barcodeResult,
    required super.isFlashOn,
    required super.isFront,
  });
  @override
  List<Object?> get props => [barcodeResult, isFlashOn, isFront];
}

class ScannerSuccess extends ScannerState {
  final String barcode;
  final dynamic format;
  const ScannerSuccess(this.barcode,this.format);

  @override
  List<Object?> get props => [barcode];
}
