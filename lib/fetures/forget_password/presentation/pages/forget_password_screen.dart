import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:he_dg/config/routs/routs.dart';
import 'package:he_dg/core/utils/app_colors.dart';
import 'package:he_dg/core/utils/app_images.dart';
import 'package:he_dg/core/utils/app_styles.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../bloc/forget_password_bloc.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late Animation<Duration> durationAnimation;

  late AnimationController animationController;



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
                      Image.asset(
                        AppImages.forgotPasswordImage,
                        width: 140.w,
                        height: 140.h,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Forgot Password?",
                        style: AppStyles.introTitleStyle,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "enter your phone number to reset your password",
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
                              InternationalPhoneNumberInput(
                                onInputChanged: (value) {},
                                textFieldController: ForgetPasswordBloc.get(context).phoneNumberController,
                                initialValue: ForgetPasswordBloc.get(context).number,
                                formatInput: true,
                                textStyle: AppStyles.subTitleStyle,
                                selectorTextStyle: AppStyles.subTitleStyle,
                                inputBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22.r),
                                    borderSide: BorderSide(
                                        color: AppColors.borderColor)),
                                selectorConfig: SelectorConfig(
                                  trailingSpace: false,
                                  leadingPadding: 14.h,
                                  setSelectorButtonAsPrefixIcon: true,
                                  selectorType: PhoneInputSelectorType.DROPDOWN,
                                  // useBottomSheetSafeArea: true,
                                ),
                              ),
                              SizedBox(height: 25.h),
                              ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.pushNamed(context,AppRouts.createPasswordScreen);
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
                      SizedBox(
                        height: 31.h,
                      ),
                      TweenAnimationBuilder(
                        tween: Tween<Duration>(
                            begin: const Duration(seconds: 30),
                            end: const Duration(seconds: 0)),
                        builder: (context, value, child) =>
                        (value.inSeconds > 0) ? Text(
                          "Re-Send Code In 0:${value.inSeconds}",
                          style: AppStyles.forgetPasswordStyle
                              .copyWith(color: AppColors.titleColor),
                          textAlign: TextAlign.center,
                        ):Text(
                          "Re-Send Code Now",
                          style: AppStyles.forgetPasswordStyle
                              .copyWith(color: AppColors.titleColor),
                          textAlign: TextAlign.center,
                        ),
                        duration: const Duration(seconds: 30),
                      )
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
