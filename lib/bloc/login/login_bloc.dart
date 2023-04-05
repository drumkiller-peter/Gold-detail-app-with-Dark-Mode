import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_coach/data/repository/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._authenticationRepository) : super(LoginInitial()) {
    on<LoginRequested>((event, emit) async {
      if (loginKey.currentState!.validate()) {
        emit(LoginLoadInProgress());
        await Future.delayed(const Duration(seconds: 1));

        final response = _authenticationRepository.matchData(
          email.text.trim(),
          password.text.trim(),
        );
        if (response) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure());
        }
      }
    });
  }

  final AuthenticationRepository _authenticationRepository;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
}
