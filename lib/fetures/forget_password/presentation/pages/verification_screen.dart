import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:he_dg/config/routs/routs.dart';
import 'package:he_dg/core/utils/app_images.dart';
import 'package:he_dg/core/utils/app_styles.dart';

import '../../../../core/utils/app_colors.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold   (
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
          SvgPicture.asset(
            AppImages.secondaryAppLogo,
            width: 140.w,
            height: 43.h,
          ),
          SizedBox(height: 33.h,),
          Text("Enter PIN code", style: AppStyles.subTitleStyle,),
          SizedBox(height: 240.h,),
          OtpTextField(
            numberOfFields: 4,
            borderColor: AppColors.primaryColor,
            showFieldAsBox: true,
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
