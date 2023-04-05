import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_coach/data/models/user/user_model.dart';
import 'package:remote_coach/data/repository/authentication_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._authenticationRepository) : super(SignUpInitial()) {
    on<SignUpRequested>((event, emit) async {
      if (signUpKey.currentState!.validate()) {
        emit(SignUpLoadInProgress());
        // Removing the existing user data and only saving the new user data
        await _authenticationRepository.removeUserData();
        UserModel userModel = UserModel(
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          password: password.text.trim(),
        );
        final isUserAdded =
            await _authenticationRepository.saveUserData(userModel);
        if (isUserAdded) {
          emit(SignUpSuccess());
        } else {
          emit(SignUpFailure());
        }
      }
    });
  }

  final AuthenticationRepository _authenticationRepository;
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
}
