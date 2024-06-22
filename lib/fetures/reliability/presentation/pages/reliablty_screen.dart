import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:he_dg/config.dart';
import 'package:he_dg/config/routs/routs.dart';
import 'package:he_dg/core/utils/app_colors.dart';
import 'package:he_dg/core/utils/app_images.dart';
import 'package:he_dg/core/utils/app_styles.dart';
import 'package:he_dg/fetures/reliability/domain/use_cases/get_image_from_camera_usecase.dart';
import 'package:he_dg/fetures/reliability/presentation/pages/custom_picke_images_screem.dart';
import 'package:he_dg/fetures/reliability/presentation/widgets/custom_spacer.dart';
import 'package:he_dg/fetures/reliability/presentation/widgets/custom_step.dart';

import '../bloc/reliability_bloc.dart';

class ReliabilityScreen extends StatelessWidget {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReliabilityBloc(getIt<GetImageFromCameraUseCase>()),
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            AppImages.secondaryAppLogo,
            width: 143.w,
            height: 43.h,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<ReliabilityBloc, ReliabilityState>(
          builder: (context, state) {
            List<Widget> pages = [
              CustomPickerImagesPage(
                  imageFile: state.idCardFrontFile,
                  getImage: () {
                    print("object");
                    ReliabilityBloc.get(context).add(GetIDCardFrontEvent());
                  },
                  instructions:
                      "Please take a photo to your ID Front,Make sure it’s clear  ",
                  title: "Add National ID Front",
                  hint: "ID Card (Front)"),
              CustomPickerImagesPage(
                  imageFile: state.idCardBackFile,
                  getImage: () {
                    ReliabilityBloc.get(context).add(GetIDCardBackEvent());
                  },
                  instructions:
                      "Please take a photo to your ID Back,Make sure it’s clear",
                  title: "Add National ID Back",
                  hint: "ID Card (Back)"),
              CustomPickerImagesPage(
                  imageFile: state.faceFile,
                  getImage: () {
                    ReliabilityBloc.get(context).add(GetFaceEvent());
                  },
                  instructions: "Please make sure you have a clear background.",
                  title: "Face",
                  hint: "Look to the camera"),
              CustomPickerImagesPage(
                  imageFile: state.faceRightFile,
                  getImage: () {
                    ReliabilityBloc.get(context).add(GetFaceRightEvent());
                  },
                  instructions: "Please make sure you have a clear background.",
                  title: "Face right",
                  hint: "Look to the camera"),
              CustomPickerImagesPage(
                  imageFile: state.faceLeftFile,
                  getImage: () {
                    ReliabilityBloc.get(context).add(GetFaceLeftEvent());
                  },
                  instructions: "Please make sure you have a clear background.",
                  title: "Face Left",
                  hint: "Look to the camera"),
            ];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomStep(
                          isDone: (state.currentStep ?? 0) > 0,
                          stepNumber: "1",
                          stepName: "ID \n Front",
                          isActive: (state.currentStep ?? 0) == 0),
                      const CustomSpacer(),
                      CustomStep(
                          isDone: (state.currentStep ?? 0) > 1,
                          stepNumber: "2",
                          stepName: "ID \n Back",
                          isActive: (state.currentStep ?? 0) == 1),
                      const CustomSpacer(),
                      CustomStep(
                          isDone: (state.currentStep ?? 0) > 2,
                          stepNumber: "3",
                          stepName: "Face",
                          isActive: (state.currentStep ?? 0) == 2),
                      const CustomSpacer(),
                      CustomStep(
                          isDone: (state.currentStep ?? 0) > 3,
                          stepNumber: "4",
                          stepName: "Face \n right",
                          isActive: (state.currentStep ?? 0) == 3),
                      const CustomSpacer(),
                      CustomStep(
                          isDone: (state.currentStep ?? 0) > 4,
                          stepNumber: "5",
                          stepName: "Face \n Left",
                          isActive: (state.currentStep ?? 0) == 4),
                      const CustomSpacer(),
                      CustomStep(
                          isDone: (state.currentStep ?? 0) > 5,
                          stepNumber: "6",
                          stepName: "Confirmation",
                          isActive: (state.currentStep ?? 0) == 5),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: ReliabilityBloc.get(context).controller,
                      children: pages,
                    ),
                  ),
                  // const Spacer(),
                  ElevatedButton(
                    onPressed: (((state.currentStep ?? 0) == 0 &&
                                state.idCardFrontFile != null) ||
                            (state.currentStep == 1 &&
                                state.idCardBackFile != null) ||
                            (state.currentStep == 2 &&
                                state.faceFile != null) ||
                            (state.currentStep == 3 &&
                                state.faceRightFile != null) ||
                            (state.currentStep == 4 &&
                                state.faceLeftFile != null))
                        ? () {
                            if (state.currentStep != 4) {
                              ReliabilityBloc.get(context).add(NextStepEvent());
                            } else {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRouts.homeScreen,
                                (route) => false,
                              );
                            }
                          }
                        : null,
                    style: AppStyles.sendButtonStyle,
                    child: Text(
                      "Save",
                      style: AppStyles.regularStyle,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
