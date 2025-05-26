import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc() : super((const ScannerInitial())) {
    on<ScannerDetectedEvent>((event, emit) {
      emit(
        ScannerUpdateState(
          barcodeResult: event.barcode,
          isFlashOn: state.isFlashOn,
          isFront: state.isFront,
        ),
      );
    });

    on<ScannerToggleFlashEvent>((event, emit) {
      emit(
        ScannerUpdateState(
          barcodeResult: state.barcodeResult,
          isFlashOn: !state.isFlashOn,
          isFront: state.isFront,
        ),
      );
    });
    on<ScannerSwitchCameraEvent>((event, emit) {
      emit(
        ScannerUpdateState(
          barcodeResult: state.barcodeResult,
          isFlashOn: state.isFlashOn,
          isFront: !state.isFront,
        ),
      );
    });

    on<BarcodeScanned>((event, emit) {
      emit(ScannerSuccess(event.barcode,event.format));
    });
    on<BarcodeReset>((event, emit) {
      emit(ScannerInitial());
    });
  }
}
