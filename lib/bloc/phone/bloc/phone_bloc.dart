import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_event.dart';
part 'phone_state.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  PhoneBloc() : super(PhoneInitial()) {
    // Genereate QR
    on<GenereatePhoneQrEvent>((event, emit) {
      try {
        if (event.phoneNumber.length == 10) {
          emit(PhoneQrGenerated(qrData: event.phoneNumber));
        } else {
          if (event.phoneNumber.isEmpty) {
            emit(PhoneQrError(errorMessage: "Please Entered numbers"));
          }
          emit(
            PhoneQrError(errorMessage: "Please Entered Valid 10-digit numbers"),
          );
        }
      } catch (e) {
        emit(PhoneQrError(errorMessage: 'Phone Qr : ${e.toString()}'));
      }
    });

    // Reset QR
    on<PhoneQrResetEvent>((event, emit) {
      try {
        emit(PhoneInitial());
      } catch (e) {
        emit(
          PhoneQrError(
            errorMessage: "Don't Reset QR Something went wrong.. $e",
          ),
        );
      }
    });
  }
}
