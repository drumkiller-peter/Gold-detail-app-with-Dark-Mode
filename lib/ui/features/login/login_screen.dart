import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_coach/bloc/login/login_bloc.dart';
import 'package:remote_coach/data/repository/authentication_repository.dart';
import 'package:remote_coach/ui/features/login/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(context.read<AuthenticationRepository>()),
      child: const Scaffold(
        body: SingleChildScrollView(child: LoginBody()),
      ),
    );
  }
}
