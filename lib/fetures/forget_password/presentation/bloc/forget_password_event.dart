part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordEvent {

}
class ChangeNewPasswordVisibility extends ForgetPasswordEvent{}
class ChangeRePasswordVisibility extends ForgetPasswordEvent{}