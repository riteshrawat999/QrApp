part of 'phone_bloc.dart';

sealed class PhoneState extends Equatable {
  const PhoneState();

  @override
  List<Object> get props => [];
}

final class PhoneInitial extends PhoneState {}

final class PhoneQrGenerated extends PhoneState {
  final String qrData;
  const PhoneQrGenerated({required this.qrData});

  @override
  List<Object> get props => [qrData];
}

final class PhoneQrError extends PhoneState {
  final String errorMessage;
  const PhoneQrError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
