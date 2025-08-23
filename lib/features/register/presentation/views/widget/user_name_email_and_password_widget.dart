import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/text_button_widget.dart';
import '../../../../../core/utils/text_field_widget.dart';

class UserNameEmailAndPasswordWiget extends StatelessWidget {
  const UserNameEmailAndPasswordWiget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.h),
        TextFieldWidget(
          textlabel: 'username',
          iconData: Icons.person,
        ),
        SizedBox(height: 20.h),
        Text(
          'Email',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.h),
        TextFieldWidget(
          textlabel: 'Email',
          iconData: Icons.email,
        ),
        SizedBox(height: 20.h),
        Text(
          'Password',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.h),
        TextFieldWidget(
          textlabel: 'Password',
          iconData: Icons.password,
        ),
        SizedBox(height: 20.h),
        Text(
          'Confirm Password',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.h),
        TextFieldWidget(
          textlabel: 'Confirm Password',
          iconData: Icons.password,
        ),
        SizedBox(height: 30.h),
        TextButtonWidget(
          text: 'Register',
          onPressed: () {},
        ),
      ],
    );
  }
}
