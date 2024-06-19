import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl_phone_number_input/intl_phone_number_input_test.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  static SignUpBloc get(BuildContext context)=>BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      if (event is ChangePasswordVisibilityEvent) {
        emit(state.copyWith(
            passwordIsVisible: !(state.passwordIsVisible ?? false)));
      }
      else if(event is PhoneNumberTypingEvent){
       emit (state.copyWith(phoneNumber: event.phoneNumber,));
      }
    });
  }
}
