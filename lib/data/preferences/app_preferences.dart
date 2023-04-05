import 'dart:convert';

import 'package:remote_coach/configs/enum/app_enums.dart';
import 'package:remote_coach/data/models/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  final SharedPreferences sharedPreferences;
  AppPreference({
    required this.sharedPreferences,
  });

  static const String _user = 'user';
  static const String _isLoggedIn = 'is-logged-in';
  static const String _themeMode = 'theme-mode';

  Future<bool> saveUserData(UserModel user) async {
    await sharedPreferences.setString(
      _user,
      jsonEncode(
        user.toJson(),
      ),
    );
    return true;
  }

  UserModel getUser() {
    final userData = sharedPreferences.getString(_user);
    if (userData != null) {
      return UserModel.fromJson(
        jsonDecode(userData),
      );
    } else {
      return UserModel.empty();
    }
  }

  Future<void> setIsLoggendIn(bool isLoggedIn) async {
    await sharedPreferences.setBool(_isLoggedIn, isLoggedIn);
  }

  bool getIsLoggendIn() {
    return sharedPreferences.getBool(_isLoggedIn) ?? false;
  }

  Future<void> clearAllData() async {
    await sharedPreferences.clear();
  }

  Future<void> removeExistingUser() async {
    await sharedPreferences.remove(_user);
  }

  String getThemeStatus() {
    return sharedPreferences.getString(_themeMode) ??
        AppThemeMode.darkMode.name;
  }

  Future<void> setThemeStatus(AppThemeMode appThemeMode) async {
    switch (appThemeMode) {
      case AppThemeMode.darkMode:
        await sharedPreferences.setString(
            _themeMode, AppThemeMode.darkMode.name);
        break;
      case AppThemeMode.lightMode:
        await sharedPreferences.setString(
            _themeMode, AppThemeMode.lightMode.name);

        break;

      default:
        await sharedPreferences.setString(
            _themeMode, AppThemeMode.darkMode.name);
    }
  }
}
