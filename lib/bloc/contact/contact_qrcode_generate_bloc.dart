import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_scanner_app/models/contact_model_generate.dart';
part 'contact_qrcode_generate_event.dart';
part 'contact_qrcode_generate_state.dart';

class ContactQrcodeGenerateBloc
    extends Bloc<ContactQrcodeGenerateEvent, ContactQrcodeGenerateState> {
  ContactQrcodeGenerateBloc() : super(ContactQrcodeInitial()) {
    on<GenerateContactQrcode>((event, emit) {});
  }
}
