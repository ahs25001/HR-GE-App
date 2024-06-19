part of 'sign_up_bloc.dart';

enum SignUpScreenState { init }

@immutable
class SignUpState {
  SignUpScreenState? signUpScreenState;
  bool? passwordIsVisible;
  PhoneNumber? phoneNumber;

  SignUpState(
      {this.signUpScreenState, this.passwordIsVisible, this.phoneNumber});

  SignUpState copyWith(
      {SignUpScreenState? signUpScreenState,
      bool? passwordIsVisible,
      PhoneNumber? phoneNumber}) {
    return SignUpState(
        passwordIsVisible: passwordIsVisible ?? this.passwordIsVisible,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        signUpScreenState: signUpScreenState ?? this.signUpScreenState);
  }
}

final class SignUpInitial extends SignUpState {
  SignUpInitial() : super(signUpScreenState: SignUpScreenState.init);
}
