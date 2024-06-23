import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:he_dg/core/utils/app_colors.dart';
import 'package:he_dg/core/utils/app_images.dart';
import 'package:he_dg/fetures/home/domain/entities/income_data.dart';
import 'package:he_dg/generated/assets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/my_pensions_part.dart';
import '../widgets/portfolio_part.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          PortfolioPart(IncomeData(60500, 11500)),
          SizedBox(
            height: 21.h,
          ),
          const MyPensionsPart()
        ],
      );
  }
}
