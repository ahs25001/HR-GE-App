import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:he_dg/core/utils/app_styles.dart';
import 'package:he_dg/fetures/home/presentation/pages/home_tab.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      const HomeTab(),
      Container(
        color: Colors.red,
      ),Container(
        color: Colors.blue,
      ),Container(
        color: Colors.amber,
      ),
    ];
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.borderBackGroundColor,
              selectedLabelStyle: AppStyles.smallTextStyle.copyWith(color: AppColors.primaryColor),
              unselectedLabelStyle:AppStyles.smallTextStyle.copyWith(color: AppColors.borderBackGroundColor) ,
              currentIndex: state.currentTab ?? 0,
              selectedIconTheme: IconThemeData(color: AppColors.primaryColor,size: 30.sp),
              unselectedIconTheme: IconThemeData(color: AppColors.borderBackGroundColor,size: 30.sp),
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                HomeBloc.get(context).add(ChangeTabEvent(value));
              },
              items: [
                const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.imageWalletIcon,
                      color: (state.currentTab == 1)
                          ? AppColors.primaryColor
                          : AppColors.borderBackGroundColor,
                      width: 28.w,
                      height: 20.h,
                    ),
                    label: "Wallet"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.explore), label: "Explore"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ],
            ),
            backgroundColor: AppColors.scaffoldBackGroundColor,
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: [
                Icon(
                  Icons.notifications,
                  color: AppColors.primaryColor,
                  size: 26.sp,
                ),
                SizedBox(
                  width: 24.w,
                )
              ],
              // elevation: 2,
              shape: RoundedRectangleBorder(
                  // side: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(18.r),
                      bottomLeft: Radius.circular(18.r))),
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: SvgPicture.asset(Assets.imageGreenAppLogo),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.0.w,
                vertical: 20.h,
              ),
              child: tabs[state.currentTab ?? 0],
            ),
          );
        },
      ),
    );
  }
}
