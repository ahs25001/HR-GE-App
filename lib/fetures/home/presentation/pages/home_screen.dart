import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:he_dg/core/utils/app_colors.dart';
import 'package:he_dg/core/utils/app_images.dart';
import 'package:he_dg/fetures/home/domain/entities/income_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/portfolio_part.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 2,
        shape:    RoundedRectangleBorder(
          // side: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(18.r),
        bottomLeft: Radius.circular(18.r))),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: SvgPicture.asset(AppImages.greenAppLogoImage),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 20.h),
        child: Column(
          children: [PortfolioPart(IncomeData(60500, 11500))],
        ),
      ),
    );
  }
}
