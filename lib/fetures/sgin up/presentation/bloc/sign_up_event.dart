part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}
class ChangePasswordVisibilityEvent extends SignUpEvent{}
class PhoneNumberTypingEvent extends SignUpEvent{
  PhoneNumber phoneNumber ;

  PhoneNumberTypingEvent(this.phoneNumber);
}
