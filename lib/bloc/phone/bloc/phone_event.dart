part of 'phone_bloc.dart';

sealed class PhoneEvent extends Equatable {
  const PhoneEvent();
  @override
  List<Object> get props => [];
}

final class GenereatePhoneQrEvent extends PhoneEvent {
  final String phoneNumber;
  const GenereatePhoneQrEvent({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

final class PhoneQrResetEvent extends PhoneEvent {
  const PhoneQrResetEvent();
  @override
  List<Object> get props => [];
}
