import 'package:chatty/common/values/values.dart';
import 'package:chatty/pages/frame/welcome/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/login_widget.dart';

class SignInPage extends GetView<WelcomeController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _listLogInItems(),
          ],
        ),
      ),
    );
  }

  Widget orBuild() {
    return Container(
      width: 295.w,
      margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              indent: 50,
              height: 2.h,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
          const Text("  or  "),
          Expanded(
            child: Divider(
              endIndent: 50,
              height: 2.h,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 100.h, bottom: 80.h),
      child: Text(
        "Chatty .",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
          fontSize: 34.sp,
        ),
      ),
    );
  }

  Widget _listLogInItems() {
    return Column(
      children: [
        const LoginWidget(
          logo: 'google',
          title: 'SignIn with Google',
        ),
        const SizedBox(height: 10),
        const LoginWidget(
          logo: 'facebook',
          title: 'SignIn with Facebook',
        ),
        const SizedBox(height: 10),
        const LoginWidget(
          logo: "apple",
          title: 'SignIn with Apple',
        ),
        // const SizedBox(height: 10),
        orBuild(),
        const SizedBox(height: 10),
        const LoginWidget(
          title: 'Login with phone number',
          logo: "",
        ),
        SizedBox(height: 40.h),
        Text(
          "Already have an account",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.normal,
            fontSize: 12.sp,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Sign up here",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryElement,
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
          ),
        )
      ],
    );
  }
}
