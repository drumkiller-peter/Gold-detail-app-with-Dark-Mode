part of 'login_bloc.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadInProgress extends LoginState {}

class LoginFailure extends LoginState {}

class LoginSuccess extends LoginState {}
