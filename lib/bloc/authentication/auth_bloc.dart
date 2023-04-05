import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_coach/configs/dependency_injection/dependency_injection.dart';
import 'package:remote_coach/configs/enum/app_enums.dart';
import 'package:remote_coach/configs/routes/app_routes.dart';
import 'package:remote_coach/configs/routes/navigator_service.dart';
import 'package:remote_coach/data/repository/authentication_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._authenticationRepository)
      : super(const AuthenticationState.unknown()) {
    on<AuthenticateUserRequested>(
      (event, emit) => _handleAuth(event, emit),
    );
    on<AuthenticationLogoutRequested>(_handleLogout);
  }

  final AuthenticationRepository _authenticationRepository;

  void _handleAuth(AuthenticateUserRequested event,
      Emitter<AuthenticationState> emit) async {
    //Delaying the authentication to show splash screen
    await Future.delayed(const Duration(seconds: 2));
    if (_authenticationRepository.getIsLoggedIn()) {
      emit(const AuthenticationState.authenticated());
    } else {
      emit(const AuthenticationState.unAuthenticated());
    }
  }

  ///For now we are not deleting any information of current user
  ///because we need the user info later for logging in back.
  _handleLogout(
      AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    _authenticationRepository.setIsLogOut();
    emit(const AuthenticationState.unAuthenticated());
    getIt
        .get<NavigatorService>()
        .navigator
        .pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
  }
}
