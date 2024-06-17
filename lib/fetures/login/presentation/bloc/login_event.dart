part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class ChangePasswordVisibility extends LoginEvent {}
