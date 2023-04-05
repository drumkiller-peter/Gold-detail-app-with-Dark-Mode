// This repository is for handling all the request related to authentication.

import 'package:remote_coach/configs/dependency_injection/dependency_injection.dart';
import 'package:remote_coach/data/models/user/user_model.dart';
import 'package:remote_coach/data/preferences/app_preferences.dart';

class AuthenticationRepository {
  final AppPreference _appPreference = getIt.get<AppPreference>();

  Future<bool> saveUserData(UserModel userModel) async {
    return await _appPreference.saveUserData(userModel);
  }

  UserModel getUserData() {
    return _appPreference.getUser();
  }

  Future<void> removeUserData() async {
    await _appPreference.removeExistingUser();
  }

  Future<void> setIsLogOut() async {
    await _appPreference.setIsLoggendIn(false);
  }

  bool getIsLoggedIn() {
    return _appPreference.getIsLoggendIn();
  }

  bool matchData(String email, String password) {
    final userExistingData = getUserData();
    if (email == userExistingData.email &&
        password == userExistingData.password) {
      return true;
    } else {
      return false;
    }
  }
}
