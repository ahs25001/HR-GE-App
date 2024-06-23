import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:he_dg/core/utils/app_colors.dart';
import 'package:he_dg/fetures/home/domain/entities/plane_model.dart';

import '../../../../core/utils/app_styles.dart';

class PensionsItem extends StatelessWidget {
  PlaneModel planeModel;

  PensionsItem(this.planeModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
        child: Row(
          children: [
            Image.asset(
              planeModel.picture,
              width: 50.w,
              height: 50.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Conservative Plan",
              style: AppStyles.forgetPasswordStyle
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  "${planeModel.investmentValue.abs()} EGP",
                  style: AppStyles.forgetPasswordStyle
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                      color: (planeModel.totalReturns.isNegative)
                          ? AppColors.loseMoneyColor.withOpacity(.1)
                          : AppColors.stepColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Text(
                    "${planeModel.totalReturns.abs()} EGP",
                    style: AppStyles.smallTextStyle.copyWith(
                        color: (planeModel.totalReturns.isNegative)
                            ? AppColors.loseMoneyColor
                            : AppColors.currentStepColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
