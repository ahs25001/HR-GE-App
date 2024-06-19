import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:he_dg/core/utils/app_colors.dart';

class AppStyles {
  static TextStyle loginTitleStyle =
      TextStyle(color: Colors.white, fontSize: 20.sp, fontFamily: "Poppins");
  static TextStyle subTitleStyle =
  TextStyle(
    fontFamily: "Poppins",
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    // color: AppColors.titleColor
  );
  static TextStyle forgetPasswordStyle =
  TextStyle(
    color: AppColors.primaryColor,
    fontFamily: "Poppins",
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    // color: AppColors.titleColor
  );
  static TextStyle regularStyle =
  TextStyle(
    color: Colors.white,
    fontFamily: "Poppins",
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    // color: AppColors.titleColor
  );
  static TextStyle introTitleStyle =
  TextStyle(
      fontFamily: "Poppins",
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.titleColor);
  static ButtonStyle loginButtonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 115.w),
      backgroundColor:
      AppColors.primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(
              18.r)));
  static ButtonStyle sendButtonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 112.w),
      backgroundColor:
      AppColors.primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(
              18.r)));
  static ButtonStyle signUpButtonStyle = ElevatedButton.styleFrom(

      padding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 100.w
      ),
      backgroundColor:
      AppColors.primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(
              18.r)));
}
