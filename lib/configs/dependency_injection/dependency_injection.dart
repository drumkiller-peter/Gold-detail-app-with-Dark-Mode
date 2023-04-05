import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:remote_coach/configs/routes/navigator_service.dart';
import 'package:remote_coach/data/api/dio_helper.dart';
import 'package:remote_coach/data/preferences/app_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

/// Dependency injection setup
void dISetup() {
  getIt.registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
  getIt.registerSingletonWithDependencies<AppPreference>(
    () => AppPreference(
      sharedPreferences: getIt.get<SharedPreferences>(),
    ),
    dependsOn: [SharedPreferences],
  );
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());
  getIt.registerLazySingleton<Dio>(() => DioHelper().dio);
  getIt.registerLazySingleton(() => NavigatorService());
}
