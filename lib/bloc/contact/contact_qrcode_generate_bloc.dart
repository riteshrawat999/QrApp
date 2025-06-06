import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_scanner_app/models/contact_model_generate.dart';
part 'contact_qrcode_generate_event.dart';
part 'contact_qrcode_generate_state.dart';

class ContactQrcodeGenerateBloc
    extends Bloc<ContactQrcodeGenerateEvent, ContactQrcodeGenerateState> {
  ContactQrcodeGenerateBloc() : super(ContactQrcodeInitial()) {
    on<GenerateContactQrcode>((event, emit) {
      emit(ContactQrcodeLoading());
      try {
        final qrData = '''{
          "firstName": "${event.firstName}",
          "lastName": "${event.lastName}",
          "email": "${event.email}",
          "phone": "${event.phone}"
        } ''';
        final contactModel = ContactModel(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          phone: event.phone,
          qrData: qrData,
          createdAt: DateTime.now(),
        );
        emit(ContactQrcodeSuccess(qrData: qrData, contactModel: contactModel));
      } catch (e) {
        emit(ContactQrcodeFailure(errorMessage: "Form Contact Qr : $e"));
      }
    });
  }
}
