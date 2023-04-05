import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_coach/bloc/authentication/auth_bloc.dart';
import 'package:remote_coach/bloc/theme_bloc/theme_bloc.dart';
import 'package:remote_coach/configs/dependency_injection/dependency_injection.dart';
import 'package:remote_coach/configs/enum/app_enums.dart';
import 'package:remote_coach/configs/routes/app_routes.dart';
import 'package:remote_coach/configs/routes/navigator_service.dart';
import 'package:remote_coach/constants/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        log(state.status.name);

        if (state.status == AuthenticationStatus.authenticated) {
          getIt
              .get<NavigatorService>()
              .navigator
              .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
        } else if (state.status == AuthenticationStatus.unAuthenticated) {
          getIt
              .get<NavigatorService>()
              .navigator
              .pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
        } else if (state.status == AuthenticationStatus.unknown) {
          getIt
              .get<NavigatorService>()
              .navigator
              .pushNamedAndRemoveUntil(AppRoutes.signUp, (route) => false);
        }
      },
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: getIt.get<NavigatorService>().navigatorKey,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            themeMode: state.appThemeMode == AppThemeMode.darkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            initialRoute: AppRoutes.splashScreen,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
