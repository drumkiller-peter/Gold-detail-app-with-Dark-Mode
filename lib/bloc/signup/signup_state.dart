part of 'signup_bloc.dart';

class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoadInProgress extends SignUpState {}

class SignUpFailure extends SignUpState {}

class SignUpSuccess extends SignUpState {}
