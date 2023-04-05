import 'package:flutter/material.dart';
import 'package:remote_coach/app/app_provider.dart';
import 'package:remote_coach/configs/dependency_injection/dependency_injection.dart';
import 'package:remote_coach/data/preferences/app_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dISetup();
  await getIt.isReady<AppPreference>();
  runApp(const AppProvider());
}
