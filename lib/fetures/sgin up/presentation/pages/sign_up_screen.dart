import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:he_dg/config/routs/routs.dart';
import 'package:he_dg/fetures/sgin%20up/presentation/widgets/sign_up_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/assets.dart';
import '../../../login/presentation/widgets/square_tile.dart';
import '../bloc/sign_up_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
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
      create: (context) => SignUpBloc(),
      child: BlocBuilder<SignUpBloc, SignUpState>(
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
                                        SignUpField(
                                          validator: (String value) {
                                            if (value.trim().isEmpty) {
                                              return "This field is required";
                                            }
                                            return null;
                                          },
                                          hint: "Full Name",
                                          controller: SignUpBloc.get(context)
                                              .nameController,
                                          focusNode: SignUpBloc.get(context)
                                              .nameFocusNode,
                                          onFieldSubmitted: () {
                                            FocusScope.of(context).requestFocus(
                                                SignUpBloc.get(context)
                                                    .emailFocusNode);
                                          },
                                        ),
                                        SizedBox(
                                          height: 17.h,
                                        ),
                                        SignUpField(
                                          isEmail: true,
                                          focusNode: SignUpBloc.get(context)
                                              .emailFocusNode,
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
                                          controller: SignUpBloc.get(context)
                                              .emailController,
                                          onFieldSubmitted: () {
                                            FocusScope.of(context).requestFocus(
                                                SignUpBloc.get(context)
                                                    .passwordFocusNode);
                                          },
                                        ),
                                        SizedBox(
                                          height: 17.h,
                                        ),
                                        SignUpField(
                                          onFieldSubmitted: () {
                                            FocusScope.of(context).requestFocus(
                                                SignUpBloc.get(context)
                                                    .phoneFocusNode);
                                          },
                                          focusNode: SignUpBloc.get(context)
                                              .passwordFocusNode,
                                          isPasswordVisible:
                                              state.passwordIsVisible ?? false,
                                          changePasswordVisibility: () {
                                            SignUpBloc.get(context).add(
                                                ChangePasswordVisibilityEvent());
                                          },
                                          hint: "Password",
                                          validator: (String value) {
                                            if (value.trim().isEmpty) {
                                              return "This field is required";
                                            }
                                            return null;
                                          },
                                          controller: SignUpBloc.get(context)
                                              .passwordController,
                                          isPassword: true,
                                        ),
                                        SizedBox(
                                          height: 17.h,
                                        ),
                                        InternationalPhoneNumberInput(
                                          focusNode: SignUpBloc.get(context)
                                              .phoneFocusNode,
                                          onInputChanged: (value) {
                                            SignUpBloc.get(context).add(
                                                PhoneNumberTypingEvent(value));
                                          },
                                          textFieldController:
                                              SignUpBloc.get(context)
                                                  .phoneNumberController,
                                          initialValue:
                                              SignUpBloc.get(context).number,
                                          formatInput: true,
                                          textStyle: AppStyles.subTitleStyle,
                                          selectorTextStyle:
                                              AppStyles.subTitleStyle,
                                          inputBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(22.r),
                                              borderSide: BorderSide(
                                                  color:
                                                      AppColors.borderColor)),
                                          selectorConfig: SelectorConfig(
                                            trailingSpace: false,
                                            leadingPadding: 14.h,
                                            setSelectorButtonAsPrefixIcon: true,
                                            selectorType:
                                                PhoneInputSelectorType.DROPDOWN,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 17.h,
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              print(state
                                                  .phoneNumber?.phoneNumber);
                                              Navigator.pushNamed(
                                                  context,
                                                  AppRouts
                                                      .verificationSignUpScreen,
                                                  arguments: state.phoneNumber
                                                      ?.phoneNumber);
                                            }
                                          },
                                          style: AppStyles.signUpButtonStyle,
                                          child: Text(
                                            "Sign Up",
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
                                              "Have An Account ?",
                                              style:
                                                  AppStyles.forgetPasswordStyle,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              onTap: () => Navigator
                                                  .pushNamedAndRemoveUntil(
                                                      context,
                                                      AppRouts.login,
                                                      (route) => false),
                                              child: Text(
                                                "Login",
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
