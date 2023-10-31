import 'package:chatty/common/values/values.dart';
import 'package:chatty/pages/frame/sign_in/controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginWidget extends StatelessWidget {
  final String title;
  final String? logo;
  const LoginWidget({
    super.key,
    required this.title,
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    final itemClicked = Get.put(SignInController());
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print("Clicked $title");
        }
        itemClicked.handleSignIn('google');
      },
      child: Container(
        width: 295.w,
        height: 44.h,
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment:
              logo == "" ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            logo == ""
                ? Container()
                : Container(
                    padding: EdgeInsets.only(left: 40.w, right: 30.w),
                    child: Image.asset("assets/icons/$logo.png"),
                  ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
            )
          ],
        ),
      ),
    );
  }
}
