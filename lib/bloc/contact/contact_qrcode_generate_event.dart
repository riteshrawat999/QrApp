part of 'contact_qrcode_generate_bloc.dart';

sealed class ContactQrcodeGenerateEvent extends Equatable {}

class ContactQrcodeGenerateInitial extends ContactQrcodeGenerateEvent {
  @override
  List<Object?> get props => [];
}

class GenerateContactQrcode extends ContactQrcodeGenerateEvent {
  final ContactModelGenerate contactModel;
  GenerateContactQrcode({required this.contactModel});
  @override
  List<Object?> get props => [contactModel];
}
