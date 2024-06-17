import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:he_dg/config/routs/routs.dart';
import 'package:he_dg/core/utils/app_colors.dart';
import 'package:he_dg/core/utils/app_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../bloc/onboarding_bloc.dart';
import 'onboarding_custom_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> onboardingPages = [
      OnboardingCustomPage(
        cliPath: AppImages.firstClipPath,
        imagePath: AppImages.firstOnboardingImage,
        title: "Shape Your Financial Future",
        description:
            "invest your money By Starting With HEDG, and secure financial freedom",
      ),
      OnboardingCustomPage(
        cliPath: AppImages.secondClipPath,
        imagePath: AppImages.secondOnboardingImage,
        description: "see your return on investments in the selected plans",
        title: "Track Your Investments",
      ),
      OnboardingCustomPage(
        cliPath: AppImages.thirdClipPath,
        imagePath: AppImages.thirdOnboardingImage,
        title: "Calculate Before Investing",
        description:
            "calculate your potential growth to choose the perfect option for you ",
      )
    ];
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Scaffold(
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: OnboardingBloc.get(context).pageController,
              children: onboardingPages,
            ),
            bottomSheet: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              width: double.infinity,
              height: 105.h,
              color: Colors.white,
              child: Row(
                children: [
                  InkWell(
                    onTap: ((state.index ?? 0) > 0)
                        ? () => OnboardingBloc.get(context)
                            .add(ToPreviousPageEvent())
                        : null,
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: ((state.index ?? 0) > 0)
                            ? AppColors.primaryColor
                            : Colors.grey,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        // color: AppColors.titleColor
                      ),
                    ),
                  ),
                  const Spacer(),
                  SmoothPageIndicator(
                      effect: ColorTransitionEffect(
                          dotColor: AppColors.stepColor,
                          activeDotColor: AppColors.currentStepColor),
                      controller: OnboardingBloc.get(context).pageController,
                      count: 3),
                  const Spacer(),
                  FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      if ((state.index ?? 0) < 2) {
                        OnboardingBloc.get(context).add(ToNextPageEvent());
                      } else {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRouts.login, (route) => false);
                      }
                    },
                    splashColor: Colors.transparent,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 26.sp,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
