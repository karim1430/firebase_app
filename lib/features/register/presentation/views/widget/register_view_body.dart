import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'user_name_email_and_password_widget.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22).w,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.flutter_dash,
                  size: 120.r,
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              'Register',
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              'Enter your personal information',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color.fromARGB(255, 130, 130, 130)),
            ),
            SizedBox(height: 20.h),
            UserNameEmailAndPasswordWiget()
          ],
        ),
      ),
    );
  }
}
