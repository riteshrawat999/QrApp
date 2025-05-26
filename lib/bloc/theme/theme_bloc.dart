import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(SuccessState(false, ThemeData())) {
    on<InitThemeEvent>((event, emit) async {
      final darkTheme = ThemeData(
        primaryColorDark: Colors.black12,
        primaryColor: Colors.black12,
        brightness: Brightness.dark,
      );

      final lightTheme = ThemeData(
        primaryColor: Colors.black12,
        primaryColorDark: Colors.black12,
        brightness: Brightness.light,
      );
      SharedPreferences sp = await SharedPreferences.getInstance();
      bool isDark = sp.getBool('isDark') ?? false;
      emit(SuccessState(isDark, isDark ? darkTheme : lightTheme));
    });

    on<ChangeThemeEvent>((event, emit) async {
      final darkTheme = ThemeData(
        primaryColorDark: Colors.black12,
        primaryColor: Colors.black12,
        brightness: Brightness.dark,
        textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      );

      final lightTheme = ThemeData(
        primaryColor: Colors.black12,
        primaryColorDark: Colors.black12,
        brightness: Brightness.light,
        textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.black)),
      );
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setBool('isDark', event.isDark);
      emit(SuccessState(event.isDark, event.isDark ? darkTheme : lightTheme));
    });
  }
}
