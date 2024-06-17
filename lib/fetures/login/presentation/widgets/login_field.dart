import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:he_dg/core/utils/app_colors.dart';
import 'package:he_dg/core/utils/app_styles.dart';

class LoginField extends StatelessWidget {
  String hint;
  TextEditingController controller;

  bool isPassword;
  Function validator;
  Function? changePasswordVisibility;
  bool isPasswordVisible;

  LoginField(
      {required this.hint,
      required this.controller,
      this.isPassword = false,
      this.isPasswordVisible = false,
      this.changePasswordVisibility,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      validator: (value) {
        return validator(value);
      },
      controller: controller,
      obscureText: !isPasswordVisible && isPassword,
      keyboardType: (!isPassword)
          ? TextInputType.emailAddress
          : TextInputType.visiblePassword,
      style: AppStyles.subTitleStyle,
      decoration: InputDecoration(
          suffixIcon: (isPassword)
              ? InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    if (changePasswordVisibility != null) {
                      changePasswordVisibility!();
                    }
                  },
                  child: (Icon(
                    (isPasswordVisible)
                        ? Icons.visibility_off
                        : Icons.remove_red_eye,
                    color: AppColors.primaryColor,
                  )),
                )
              : const SizedBox(),
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
