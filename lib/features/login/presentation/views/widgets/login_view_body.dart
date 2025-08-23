import 'package:fire_app/core/extensions/navigation_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routing/routes.dart';
import 'divider_widget.dart';
import 'email_and_password_widget.dart';
import 'follow_with_face_google_apple.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.flutter_dash,
                  size: 120.r,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'Login',
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              'login to your account to continue',
              // textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 20.h),
            EmailAndPasswordWidget(),
            SizedBox(height: 30.h),
            DividerWidget(),
            Row(children: [
              FollowWithFaceGoogleApple(
                iconData: Icons.facebook,
                color: Colors.blue,
              ),
              SizedBox(width: 20.w),
              FollowWithFaceGoogleApple(
                iconData: Icons.g_mobiledata,
                color: Colors.red,
              ), // Changed to Google icon
              SizedBox(width: 20.w),
              FollowWithFaceGoogleApple(
                iconData: Icons.apple,
                color: Colors.black,
              ),
            ]),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 14.sp),
                ),
                TextButton(
                  onPressed: () {
                    context.pushNamed(Routes.registerView);
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 14.sp, color: Colors.blue),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
