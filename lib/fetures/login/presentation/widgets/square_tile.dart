import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:he_dg/core/utils/app_colors.dart';

class SquareTile extends StatelessWidget {
  String iconPath;

  SquareTile(this.iconPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.signInIconColor,
          borderRadius: BorderRadius.circular(18.r)),
      width: 65.w,
      height: 65.h,
      child: Image.asset(iconPath),
    );
  }
}
