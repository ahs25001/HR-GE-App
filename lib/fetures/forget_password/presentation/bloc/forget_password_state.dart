part of 'forget_password_bloc.dart';

enum ForgetPasswordScreenState { init }

@immutable
class ForgetPasswordState {
  ForgetPasswordScreenState? forgetScreenPasswordState;
  bool? isNewPasswordVisible;
  bool? isRePasswordVisible;

  ForgetPasswordState(
      {this.forgetScreenPasswordState,
      this.isNewPasswordVisible,
      this.isRePasswordVisible});

  ForgetPasswordState copyWith(
      {ForgetPasswordScreenState? forgetScreenPasswordState,
      bool? isNewPasswordVisible,
      bool? isRePasswordVisible}) {
    return ForgetPasswordState(
        isNewPasswordVisible: isNewPasswordVisible ?? this.isRePasswordVisible,
        isRePasswordVisible: isRePasswordVisible ?? this.isRePasswordVisible,
        forgetScreenPasswordState:
            forgetScreenPasswordState ?? this.forgetScreenPasswordState);
  }
}

final class ForgetPasswordInitial extends ForgetPasswordState {
  ForgetPasswordInitial()
      : super(forgetScreenPasswordState: ForgetPasswordScreenState.init);
}
