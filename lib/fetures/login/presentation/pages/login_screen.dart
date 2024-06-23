import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:he_dg/config/routs/routs.dart';
import 'package:he_dg/core/utils/app_colors.dart';
import 'package:he_dg/core/utils/app_images.dart';
import 'package:he_dg/core/utils/app_styles.dart';
import 'package:he_dg/fetures/login/presentation/widgets/login_field.dart';
import 'package:he_dg/fetures/login/presentation/widgets/square_tile.dart';

import '../../../../generated/assets.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  late Animation<Offset> slideCardAnimate;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    initSlidingAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * (1 / 1.8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(120.r),
                              bottomRight: Radius.circular(120.r))),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 120.h,
                        ),
                        SvgPicture.asset(
                          Assets.imageLogo,
                          width: 140.w,
                          height: 43.h,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Log In Your Account",
                          style: AppStyles.loginTitleStyle,
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        AnimatedBuilder(
                          animation: slideCardAnimate,
                          builder: (BuildContext context, Widget? child) {
                            return SlideTransition(
                              position: slideCardAnimate,
                              child: FadeTransition(
                                opacity: opacityAnimation,
                                child: Card(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 26.w),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 50.h, horizontal: 20.w),
                                    child: Column(
                                      children: [
                                        LoginField(
                                            validator: (String value) {
                                              if (value.trim().isEmpty) {
                                                return "This field is required";
                                              }
                                              if (!RegExp(
                                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(value)) {
                                                return "This Email not valid";
                                              }
                                              return null;
                                            },
                                            hint: "Email",
                                            controller: LoginBloc.get(context)
                                                .emailController),
                                        SizedBox(
                                          height: 17.h,
                                        ),
                                        LoginField(
                                          isPasswordVisible:
                                              state.passwordIsVisible ?? false,
                                          changePasswordVisibility: () {
                                            LoginBloc.get(context).add(
                                                ChangePasswordVisibility());
                                          },
                                          hint: "Password",
                                          validator: (String value) {
                                            if (value.trim().isEmpty) {
                                              return "This field is required";
                                            }
                                            return null;
                                          },
                                          controller: LoginBloc.get(context)
                                              .passwordController,
                                          isPassword: true,
                                        ),
                                        SizedBox(
                                          height: 17.h,
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          onTap: () => Navigator.pushNamed(
                                              context, AppRouts.forgetPassword),
                                          child: Text(
                                            "Forgot Your Password?",
                                            style:
                                                AppStyles.forgetPasswordStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 17.h,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              Navigator.pushNamed(context,
                                                  AppRouts.reliabilityScreen);
                                            }
                                          },
                                          style: AppStyles.loginButtonStyle,
                                          child: Text(
                                            "Login",
                                            style: AppStyles.regularStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18.h,
                                        ),
                                        Text(
                                          "or",
                                          style: AppStyles.subTitleStyle,
                                        ),
                                        SizedBox(
                                          height: 18.h,
                                        ),
                                        Row(
                                          children: [
                                            const Spacer(),
                                            SquareTile(Assets.imageGoogleLogo),
                                            SizedBox(
                                              width: 26.w,
                                            ),
                                            SquareTile(Assets.imageAppleLogo),
                                            const Spacer(),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 18.h,
                                        ),
                                        Row(
                                          children: [
                                            const Spacer(),
                                            Text(
                                              "Don't Have An Account ?",
                                              style:
                                                  AppStyles.forgetPasswordStyle,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              onTap: () => Navigator.pushNamed(
                                                  context,
                                                  AppRouts.signUpScreen),
                                              child: Text(
                                                "Sign Up",
                                                style: AppStyles
                                                    .forgetPasswordStyle
                                                    .copyWith(
                                                        color: AppColors
                                                            .titleColor),
                                              ),
                                            ),
                                            const Spacer()
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    slideCardAnimate =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(animationController);
    opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
  }
}
