import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:he_dg/core/utils/app_colors.dart';
import 'package:he_dg/core/utils/app_images.dart';
import 'package:he_dg/core/utils/app_styles.dart';
import 'package:he_dg/fetures/reliability/presentation/widgets/custom_spacer.dart';
import 'package:he_dg/fetures/reliability/presentation/widgets/custom_step.dart';

import '../bloc/reliability_bloc.dart';

class ReliabilityScreen extends StatefulWidget {
  const ReliabilityScreen({Key? key}) : super(key: key);

  @override
  State<ReliabilityScreen> createState() => _ReliabilityScreenState();
}

class _ReliabilityScreenState extends State<ReliabilityScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReliabilityBloc(),
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
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
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
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      ReliabilityBloc.get(context).add(NextStepEvent());
                    },
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
