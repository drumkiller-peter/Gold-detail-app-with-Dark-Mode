import 'package:flutter/material.dart';
import 'package:remote_coach/ui/features/dashboard/dashboard.dart';
import 'package:remote_coach/ui/features/home/home.dart';
import 'package:remote_coach/ui/features/login/login_screen.dart';
import 'package:remote_coach/ui/features/profile/profile_screen.dart';
import 'package:remote_coach/ui/features/signup/signup_screen.dart';
import 'package:remote_coach/ui/features/splash/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = 'home';
  static const String dashboard = 'dashboard';
  static const String signUp = 'signUp';
  static const String login = 'login';
  static const String profile = 'profile';
  static const String splashScreen = 'splashScreen';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return _getMaterialRoute(const SplashScreen());
      case signUp:
        return _getMaterialRoute(const SignUpScreen());
      case login:
        return _getMaterialRoute(const LoginScreen());
      case home:
        return _getMaterialRoute(const HomeScreen());
      case dashboard:
        return _getMaterialRoute(const DashboardScreen());
      case profile:
        return _getMaterialRoute(const ProfileScreen());

      default:
        return _getMaterialRoute(
          ErrorWidget(
            Exception("Route Not Found"),
          ),
        );
    }
  }

  static MaterialPageRoute _getMaterialRoute(Widget screen) =>
      MaterialPageRoute(builder: (_) => screen);
}
