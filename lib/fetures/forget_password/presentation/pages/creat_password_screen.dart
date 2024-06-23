import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:he_dg/config/routs/routs.dart';
import 'package:he_dg/fetures/forget_password/presentation/bloc/forget_password_bloc.dart';
import 'package:he_dg/fetures/forget_password/presentation/widgets/forget_password_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/assets.dart';

class CreatePasswordScreen extends StatelessWidget {
  CreatePasswordScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordBloc(),
      child: Form(
        key: formKey,
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          body: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 55.h,
                      ),
                      SvgPicture.asset(
                        Assets.imageForgotPassword,
                        width: 140.w,
                        height: 140.h,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Create New Password",
                        style: AppStyles.introTitleStyle,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "your new password must be different from previously used passwords",
                        textAlign: TextAlign.center,
                        style: AppStyles.subTitleStyle,
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Card(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 40.h, horizontal: 20.w),
                          child: Column(
                            children: [
                              ForgetPasswordField(
                                  validator: (String value) {
                                    if (value.trim().isEmpty) {
                                      return "This field is required";
                                    }
                                  },
                                  controller: ForgetPasswordBloc.get(context)
                                      .newPasswordController,
                                  isPasswordVisible:
                                      state.isNewPasswordVisible ?? false,
                                  changePasswordVisibility: () {
                                    ForgetPasswordBloc.get(context)
                                        .add(ChangeNewPasswordVisibility());
                                  },
                                  hint: "New Password"),
                              SizedBox(
                                height: 20.h,
                              ),
                              ForgetPasswordField(
                                  validator: (String value) {
                                    if (value.trim().isEmpty) {
                                      return "This field is required";
                                    }
                                  },
                                  controller: ForgetPasswordBloc.get(context)
                                      .reNewPasswordController,
                                  isPasswordVisible:
                                      state.isRePasswordVisible ?? false,
                                  changePasswordVisibility: () {
                                    ForgetPasswordBloc.get(context)
                                        .add(ChangeRePasswordVisibility());
                                  },
                                  hint: "RePassword"),
                              SizedBox(height: 25.h),
                              ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.pushNamed(
                                        context, AppRouts.verificationScreen);
                                  }
                                },
                                style: AppStyles.sendButtonStyle,
                                child:
                                    Text("Send", style: AppStyles.regularStyle),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
