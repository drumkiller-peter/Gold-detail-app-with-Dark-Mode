import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_coach/app/app.dart';
import 'package:remote_coach/bloc/authentication/auth_bloc.dart';
import 'package:remote_coach/bloc/theme_bloc/theme_bloc.dart';
import 'package:remote_coach/data/repository/authentication_repository.dart';
import 'package:remote_coach/data/repository/profile_repository.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProfileRepository>(
          create: (context) => ProfileRepository(),
        ),
        RepositoryProvider<AuthenticationRepository>(
          create: (context) => AuthenticationRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthenticationBloc(context.read<AuthenticationRepository>())
                  ..add(AuthenticateUserRequested()),
          ),
          BlocProvider(
            create: (context) => ThemeBloc(context.read<ProfileRepository>())
              ..add(
                ThemeChangeRequested(
                  appThemeMode:
                      context.read<ProfileRepository>().getThemeMode(),
                ),
              ),
          ),
        ],
        child: const App(),
      ),
    );
  }
}
