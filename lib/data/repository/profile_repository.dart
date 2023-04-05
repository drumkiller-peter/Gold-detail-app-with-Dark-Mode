import 'package:remote_coach/configs/dependency_injection/dependency_injection.dart';
import 'package:remote_coach/configs/enum/app_enums.dart';
import 'package:remote_coach/data/preferences/app_preferences.dart';

class ProfileRepository {
  final _appPreference = getIt.get<AppPreference>();

  Future<void> changeTheme(AppThemeMode appThemeMode) async {
    await _appPreference.setThemeStatus(appThemeMode);
  }

  AppThemeMode getThemeMode() {
    var res = _appPreference.getThemeStatus();
    if (res == AppThemeMode.darkMode.name) {
      return AppThemeMode.darkMode;
    } else {
      return AppThemeMode.lightMode;
    }
  }
}
