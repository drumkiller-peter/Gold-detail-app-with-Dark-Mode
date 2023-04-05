part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final AppThemeMode appThemeMode;

  const ThemeState._({
    required this.appThemeMode,
  });

  const ThemeState.lightMode() : this._(appThemeMode: AppThemeMode.lightMode);
  const ThemeState.darkMode() : this._(appThemeMode: AppThemeMode.darkMode);
  const ThemeState.unknown() : this._(appThemeMode: AppThemeMode.darkMode);

  @override
  List<Object?> get props => [appThemeMode];
}
