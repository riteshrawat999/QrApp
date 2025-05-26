// ignore_for_file: must_be_immutable

part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  final ThemeData themeData;
  bool isDark;
  ThemeState(this.isDark, this.themeData);

  @override
  List<Object?> get props => [isDark, themeData];
}

class SuccessState extends ThemeState {
  SuccessState(super.isDark, super.themeData);

  @override
  List<Object?> get props => [isDark, themeData];
}
