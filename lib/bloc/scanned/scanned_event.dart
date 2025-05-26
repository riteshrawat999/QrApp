part of 'scanned_bloc.dart';

@immutable
sealed class ScannedEvent extends Equatable {}

final class ScannedOpenEvent extends ScannedEvent{

  @override
  List<Object?> get props => [];
}


