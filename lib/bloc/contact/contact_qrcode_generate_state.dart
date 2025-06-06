part of 'contact_qrcode_generate_bloc.dart';

sealed class ContactQrcodeGenerateState extends Equatable {}

final class ContactQrcodeInitial extends ContactQrcodeGenerateState {
  @override
  List<Object?> get props => [];
}

final class ContactQrcodeLoading extends ContactQrcodeGenerateState {
  @override
  List<Object?> get props => [];
}

final class ContactQrcodeFailure extends ContactQrcodeGenerateState {
  final String errorMessage;

  ContactQrcodeFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

final class ContactQrcodeSuccess extends ContactQrcodeGenerateState {
  final ContactModel contactModel;
  final String qrData;
  ContactQrcodeSuccess({required this.contactModel, required this.qrData});

  @override
  List<Object?> get props => [contactModel, qrData];
}
