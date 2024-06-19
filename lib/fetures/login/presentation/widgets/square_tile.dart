import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:he_dg/core/utils/app_colors.dart';

class SquareTile extends StatelessWidget {
  String iconPath;

  SquareTile(this.iconPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      decoration: BoxDecoration(
          color: AppColors.signInIconColor,
          borderRadius: BorderRadius.circular(18.r)),
      width: 65.w,
      height: 65.h,
      child: SvgPicture.asset(iconPath,width: 32.w,height: 32.h,),
    );
  }
}
