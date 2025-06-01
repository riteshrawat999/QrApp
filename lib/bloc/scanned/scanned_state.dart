part of 'scanned_bloc.dart';

@immutable
sealed class ScannedState extends Equatable {}

final class ScannedInitial extends ScannedState {
  @override
  List<Object?> get props => [];
}

final class ReturnScannedData extends ScannedState {
  final List<ScannedHistoryModel> data;
  ReturnScannedData(this.data);
  @override
  List<Object?> get props => [data];
}

final class ScannedDataLoading extends ScannedState {
  @override
  List<Object?> get props => [];
}

