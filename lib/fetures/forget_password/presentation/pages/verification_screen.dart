import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:he_dg/config/routs/routs.dart';
import 'package:he_dg/core/utils/app_images.dart';
import 'package:he_dg/core/utils/app_styles.dart';

import '../../../../core/utils/app_colors.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            AppImages.secondaryAppLogo,
            width: 140.w,
            height: 43.h,
          ),
          SizedBox(height: 33.h,),
          Text("Enter PIN code", style: AppStyles.subTitleStyle,),
          SizedBox(height: 240.h,),
          OtpTextField(
            numberOfFields: 5,
            borderColor: AppColors.primaryColor,
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRouts.login, (route) => false);
            }, // end onSubmit
          ),
        ],
      ),
    );
  }
}