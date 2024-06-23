import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:he_dg/core/utils/app_images.dart';
import 'package:he_dg/core/utils/app_styles.dart';
import 'package:he_dg/fetures/home/domain/entities/plane_model.dart';
import 'package:he_dg/fetures/home/presentation/widgets/pensions_item.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';

class MyPensionsPart extends StatelessWidget {
  const MyPensionsPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PlaneModel> plans = [
      PlaneModel(
          title: "Conservative Plan",
          picture: Assets.imageConservativePlanIcon,
          investmentValue: 2800,
          totalReturns: 272.5),
      PlaneModel(
          title: "Customized Plan",
          picture: Assets.imageCustomizedPlanImage,
          investmentValue: 5300,
          totalReturns: -265),
      PlaneModel(
          title: "Aggressive Plan",
          picture: Assets.imageAggressivePlan,
          investmentValue: 2500,
          totalReturns: 212.5),
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Pensions",
              style: AppStyles.forgetPasswordStyle,
            ),
            Container(
                decoration: BoxDecoration(
                    color: AppColors.borderBackGroundColor,
                    borderRadius: BorderRadius.circular(18.w)),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 18.w),
                child: Text(
                  "Orders",
                  style: AppStyles.smallTextStyle,
                ))
          ],
        ),
        SizedBox(
          height: 15.w,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
                  itemBuilder: (context, index) => PensionsItem(plans[index]),
                  itemCount: plans.length,
                )
      ],
    );
  }
}
