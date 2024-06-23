import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:he_dg/core/utils/app_styles.dart';
import 'package:he_dg/fetures/home/domain/entities/income_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/utils/app_colors.dart';
import '../pages/home_tab.dart';

class PortfolioPart extends StatelessWidget {
  IncomeData incomeData;

  PortfolioPart(this.incomeData);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(18.r) ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical:17.h ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi Ahmed!",
                      style: AppStyles.forgetPasswordStyle,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "date of day",
                      style: AppStyles.smallTextStyle
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 10.sp),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Text(
                        "Investment Value",
                        style: AppStyles.smallTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Text(
                        "${incomeData.investmentValue} EGP",
                        style: AppStyles.smallTextStyle
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Text(
                        "Total Returns",
                        style: AppStyles.smallTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Text(
                        "${incomeData.totalReturns} EGP",
                        style: AppStyles.smallTextStyle
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_drop_up,
                            color: AppColors.stepColor,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "${((((incomeData.totalReturns / incomeData.investmentValue) * 100).toString().length) < 5) ? ((incomeData.totalReturns / incomeData.investmentValue) * 100).toString() : ((incomeData.totalReturns / incomeData.investmentValue) * 100).toString().substring(0, 5)} %",
                            style: AppStyles.smallTextStyle
                                .copyWith(
                                  color: AppColors.stepColor,
                                )
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SfCircularChart(
                      palette: [
                        AppColors.currentStepColor,
                        Colors.grey.withOpacity(.5),
                      ],
                      series: <DoughnutSeries<double, String>>[
                        DoughnutSeries(
                          dataSource: [
                            ((incomeData.totalReturns /
                                    incomeData.investmentValue) *
                                100),
                            100 -
                                ((incomeData.totalReturns /
                                        incomeData.investmentValue) *
                                    100),
                          ],
                          xValueMapper: (value, _) => "",
                          yValueMapper: (value, _) => value,
                          radius: "100%",
                          innerRadius: "85%",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "${incomeData.investmentValue} EGP",
                          style: AppStyles.smallTextStyle
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 6.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                              color: AppColors.stepColor,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              "${((((incomeData.totalReturns / incomeData.investmentValue) * 100).toString().length) < 5) ? ((incomeData.totalReturns / incomeData.investmentValue) * 100).toString() : ((incomeData.totalReturns / incomeData.investmentValue) * 100).toString().substring(0, 5)} %",
                              style: AppStyles.smallTextStyle
                                  .copyWith(
                                    color: AppColors.stepColor,
                                  )
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ))
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: AppStyles.portfolioDetailsButtonStyle,
              child: Text(
                "Portfolio Details",
                style: AppStyles.regularStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
