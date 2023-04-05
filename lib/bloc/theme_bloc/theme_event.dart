// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ThemeChangeRequested extends ThemeEvent {
  final AppThemeMode appThemeMode;
  ThemeChangeRequested({
    required this.appThemeMode,
  });

  @override
  List<Object?> get props => [appThemeMode];
}
