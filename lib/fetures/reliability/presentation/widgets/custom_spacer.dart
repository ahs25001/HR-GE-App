import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:he_dg/core/utils/app_colors.dart';
import 'package:he_dg/core/utils/app_styles.dart';

class CustomSpacer extends StatelessWidget {
  const CustomSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 14.h,
          ),
          Container(
            height: 5.h,
            color: AppColors.spacerColor,
          ),
        ],
      ),
    );
  }
}
