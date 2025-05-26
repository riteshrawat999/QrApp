part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final bool isDark;
  ChangeThemeEvent(this.isDark);

  @override
  List<Object> get props => [isDark];
}

class InitThemeEvent extends ThemeEvent {
  @override
  List<Object> get props => [];
}
