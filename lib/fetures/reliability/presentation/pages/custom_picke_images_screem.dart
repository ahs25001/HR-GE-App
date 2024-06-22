import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:he_dg/config.dart';
import 'package:he_dg/core/utils/app_colors.dart';
import 'package:he_dg/core/utils/app_styles.dart';
import 'package:he_dg/fetures/reliability/presentation/bloc/reliability_bloc.dart';

import '../../domain/use_cases/get_image_from_camera_usecase.dart';

class CustomPickerImagesPage extends StatelessWidget {
  String instructions;
  String title;
  String hint;
  File? imageFile;
  Function getImage;

  CustomPickerImagesPage(
      {required this.instructions,
      required this.title,
      required this.hint,
      required this.imageFile,
      required this.getImage});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReliabilityBloc(getIt<GetImageFromCameraUseCase>()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: AppStyles.forgetPasswordStyle
                .copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 18.h,
          ),
          Center(
            child: Card(
              elevation: 3,
              color: Colors.white,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 30.0.h, horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      hint,
                      style: AppStyles.pickerHintStyle,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      instructions,
                      style: AppStyles.pickerInstructionsStyle,
                    ),
                    SizedBox(
                      height: 65.h,
                    ),
                    (imageFile == null)
                        ? Center(
                          child: InkWell(
                              onTap: () {
                                getImage();
                              },
                              child: DottedBorder(
                                color: AppColors.primaryColor,
                                dashPattern: [16.w, 16.w, 16.w, 16.w],
                                padding: EdgeInsets.symmetric(
                                    horizontal: 114.w, vertical: 55.h),
                                child: Icon(
                                  Icons.add,
                                  size: 60.sp,
                                  color: AppColors.primaryColor,
                                ),
                                // decoration: BoxDecoration(border: Border.all(color: Colors.black,)),
                              ),
                            ),
                        )
                        : Center(
                          child: Image.file(
                              imageFile!,
                              width: 282.w,
                              fit: BoxFit.cover,
                              height: 162.h,
                            ),
                        ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
