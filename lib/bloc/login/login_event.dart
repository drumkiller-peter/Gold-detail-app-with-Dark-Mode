// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends LoginEvent {}
