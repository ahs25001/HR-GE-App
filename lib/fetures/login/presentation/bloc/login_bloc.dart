import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static LoginBloc get(BuildContext context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      if (event is ChangePasswordVisibility) {
        emit(state.copyWith(
            passwordIsVisible: !(state.passwordIsVisible ?? false)));
      }
    });
  }
}
