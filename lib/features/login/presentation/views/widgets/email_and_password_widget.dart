import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/text_field_widget.dart';
import 'login_view_body.dart';

class EmailAndPasswordWidget extends StatelessWidget {
  const EmailAndPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          textlabel: 'Email',
          iconData: Icons.email,
        ),
        SizedBox(height: 20.h),
        TextFieldWidget(
          textlabel: 'Password',
          iconData: Icons.password,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              style: TextStyle(fontSize: 14.sp, color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            minimumSize: Size(double.infinity, 50.h),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 18.sp),
          ),
        ),
      ],
    );
  }
}
