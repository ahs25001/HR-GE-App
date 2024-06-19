import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:he_dg/config/routs/routs.dart';
import 'package:he_dg/core/utils/app_colors.dart';
import 'package:he_dg/core/utils/app_images.dart';
import 'package:he_dg/core/utils/app_styles.dart';

class OnboardingCustomPage extends StatelessWidget {
  String cliPath;
  String imagePath;
  String title;
  String description;

  OnboardingCustomPage(
      {required this.cliPath,
      required this.imagePath,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: InkWell(
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, AppRouts.login, (route) => false),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "skip",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleColor),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  cliPath,
                  width: 305.w,
                  height: 290.h,
                ),
                SvgPicture.asset(
                  imagePath,
                  width: 218.w,
                  height: 220.h,
                )
              ],
            ),
          ),
          SizedBox(
            height: 74.h,
          ),
          Text(
            title,
            style: AppStyles.introTitleStyle,
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 260.w,
            child: Text(
              textAlign: TextAlign.center,
              description,
              style:AppStyles.subTitleStyle
            ),
          )
        ],
      ),
    );
  }
}
