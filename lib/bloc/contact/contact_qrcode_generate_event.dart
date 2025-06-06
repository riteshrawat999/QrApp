part of 'contact_qrcode_generate_bloc.dart';

sealed class ContactQrcodeGenerateEvent extends Equatable {}

class ContactQrcodeGenerateInitial extends ContactQrcodeGenerateEvent {
  @override
  List<Object?> get props => [];
}

class GenerateContactQrcode extends ContactQrcodeGenerateEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  GenerateContactQrcode({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });
  @override
  List<Object?> get props => [firstName, lastName, email, phone];
}
