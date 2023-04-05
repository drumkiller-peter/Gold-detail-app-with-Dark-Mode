import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_coach/bloc/signup/signup_bloc.dart';
import 'package:remote_coach/data/repository/authentication_repository.dart';
import 'package:remote_coach/ui/common/keyboard_dismissible_view.dart';
import 'package:remote_coach/ui/features/signup/widgets/signup_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(context.read<AuthenticationRepository>()),
      child: const Scaffold(
        body: KeyboardDismissibleView(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SignUpBody(),
            ),
          ),
        ),
      ),
    );
  }
}
