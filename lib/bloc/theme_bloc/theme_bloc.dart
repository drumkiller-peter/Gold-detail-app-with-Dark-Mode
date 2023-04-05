import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remote_coach/configs/enum/app_enums.dart';
import 'package:remote_coach/data/repository/profile_repository.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(this._profileRepository)
      : super(const ThemeState._(appThemeMode: AppThemeMode.darkMode)) {
    on<ThemeChangeRequested>((event, emit) async {
      emit(const ThemeState.unknown());
      await _profileRepository.changeTheme(event.appThemeMode);
      final themeMode = _profileRepository.getThemeMode();
      log(themeMode.toString());
      if (themeMode == AppThemeMode.darkMode) {
        _isDarkMode = true;
        emit(const ThemeState.darkMode());
      } else if (themeMode == AppThemeMode.lightMode) {
        _isDarkMode = false;
        emit(const ThemeState.lightMode());
      } else {
        _isDarkMode = true;
        emit(const ThemeState.unknown());
      }
    });
  }

  final ProfileRepository _profileRepository;
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;
}
