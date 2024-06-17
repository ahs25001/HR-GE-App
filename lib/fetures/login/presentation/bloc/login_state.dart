part of 'login_bloc.dart';

enum LoginScreenState {
  init,
}

@immutable
class LoginState {
  LoginScreenState? loginScreenState;
  bool? passwordIsVisible;

  LoginState({this.loginScreenState, this.passwordIsVisible});

  LoginState copyWith(
      {LoginScreenState? loginScreenState, bool? passwordIsVisible}) {
    return LoginState(
        loginScreenState: loginScreenState ?? this.loginScreenState,
        passwordIsVisible: passwordIsVisible ?? this.passwordIsVisible);
  }
}

final class LoginInitial extends LoginState {
  LoginInitial() : super(loginScreenState: LoginScreenState.init);
}
