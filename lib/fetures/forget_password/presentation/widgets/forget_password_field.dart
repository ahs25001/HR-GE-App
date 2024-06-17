import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ForgetPasswordField extends StatelessWidget {
  Function validator;

  TextEditingController controller;

  bool isPasswordVisible;
  Function changePasswordVisibility;
  String hint;

  ForgetPasswordField(
      {required this.validator,
      required this.controller,
      required this.isPasswordVisible,
      required this.changePasswordVisibility,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      validator: (value) {
        return validator(value);
      },
      controller: controller,
      obscureText: !isPasswordVisible,
      keyboardType: TextInputType.visiblePassword,
      style: AppStyles.subTitleStyle,
      decoration: InputDecoration(
          suffixIcon: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              changePasswordVisibility();
            },
            child: (Icon(
              (isPasswordVisible) ? Icons.visibility_off : Icons.remove_red_eye,
              color: AppColors.primaryColor,
            )),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: BorderSide(color: AppColors.primaryColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: BorderSide(color: AppColors.primaryColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: BorderSide(color: AppColors.primaryColor)),
          labelText: hint,
          labelStyle: TextStyle(color: AppColors.primaryColor)),
    );
  }
}
