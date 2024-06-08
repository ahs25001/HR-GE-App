import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:he_dg/core/utils/app_colors.dart';
import 'package:he_dg/core/utils/app_images.dart';

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
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  cliPath,
                  width: 305.w,
                  height: 290.h,
                ),
                Image.asset(
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
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.titleColor),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 260.w,
            child: Text(
              textAlign: TextAlign.center,
              description,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                // color: AppColors.titleColor
              ),
            ),
          )
        ],
      ),
    );
  }
}
