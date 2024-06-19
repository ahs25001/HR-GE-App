import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CustomStep extends StatelessWidget {
  String stepNumber;
  String stepName;
  bool isActive;
  bool isDone;

  CustomStep(
      {required this.stepNumber,
      required this.stepName,
      required this.isActive,
      required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 30.w,
          height: 30.h,
          // color: /Colors.red,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (isActive || isDone)
                  ? AppColors.currentStepColor
                  : Colors.white,
              border: Border.all(
                  color: (isDone)
                      ? AppColors.currentStepColor
                      : (isActive)
                          ? Colors.white
                          : (AppColors.spacerColor))),
          child: Center(
            child: Text(
              stepNumber,
              style: AppStyles.subTitleStyle
                  .copyWith(color: (isActive||isDone) ? Colors.white : Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        Text(
          stepName,
          textAlign: TextAlign.center,
          style: AppStyles.subTitleStyle.copyWith(
              color: (isActive || isDone)
                  ? AppColors.titleColor
                  : AppColors.spacerColor,
              fontSize: 10),
        )
      ],
    );
  }
}
