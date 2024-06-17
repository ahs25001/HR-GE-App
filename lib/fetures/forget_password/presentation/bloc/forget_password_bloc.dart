import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:he_dg/fetures/forget_password/presentation/pages/forget_password_screen.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

part 'forget_password_event.dart';

part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  static ForgetPasswordBloc get(BuildContext context) =>
      BlocProvider.of(context);
  String initialCountry = 'EG';

  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reNewPasswordController = TextEditingController();

  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ForgetPasswordEvent>((event, emit) {
      if (event is ChangeNewPasswordVisibility) {
        emit(state.copyWith(
            isNewPasswordVisible: !(state.isNewPasswordVisible ?? false),
            isRePasswordVisible: state.isRePasswordVisible));
      } else if (event is ChangeRePasswordVisibility) {
        emit(state.copyWith(
            isNewPasswordVisible: state.isNewPasswordVisible,
            isRePasswordVisible: !(state.isRePasswordVisible ?? false)));
      }
    });
  }
}
