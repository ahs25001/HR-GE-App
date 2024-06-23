import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:he_dg/fetures/sgin%20up/presentation/bloc/sign_up_bloc.dart';
import 'package:he_dg/generated/assets.dart';

import '../../../../config/routs/routs.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class VerificationSignUpScreen extends StatelessWidget {
  const VerificationSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => SignUpBloc(),
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
        body: BlocBuilder<SignUpBloc, SignUpState>(
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
                      Assets.imageVerificationImage,
                      width: 140.w,
                      height: 140.h,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Verification",
                      style: AppStyles.introTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "enter 4 digit numbers that sent to $arg",
                      textAlign: TextAlign.center,
                      style: AppStyles.subTitleStyle,
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    OtpTextField(
                      numberOfFields: 4,
                      borderColor: AppColors.primaryColor,
                      showFieldAsBox: true,
                      onSubmit: (String verificationCode) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRouts.login, (route) => false);
                      }, // end onSubmit
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    TweenAnimationBuilder(
                      tween: Tween<Duration>(
                          begin: const Duration(seconds: 30),
                          end: const Duration(seconds: 0)),
                      builder: (context, value, child) => (value.inSeconds > 0)
                          ? Text(
                              "Re-Send Code In 0:${value.inSeconds}",
                              style: AppStyles.forgetPasswordStyle
                                  .copyWith(color: AppColors.titleColor),
                              textAlign: TextAlign.center,
                            )
                          : Text(
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
    );
  }
}
