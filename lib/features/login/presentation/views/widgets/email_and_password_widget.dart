import 'dart:developer';

import 'package:fire_app/core/extensions/navigation_extensions.dart';
import 'package:fire_app/core/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/text_button_widget.dart';
import '../../../../../core/utils/text_field_widget.dart';

class EmailAndPasswordWidget extends StatefulWidget {
  const EmailAndPasswordWidget({
    super.key,
  });

  @override
  State<EmailAndPasswordWidget> createState() => _EmailAndPasswordWidgetState();
}

class _EmailAndPasswordWidgetState extends State<EmailAndPasswordWidget> {
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.h),
        TextFieldWidget(
          textlabel: 'Email',
          iconData: Icons.email,
          textEditingController: emailAddressController,
        ),
        SizedBox(height: 20.h),
        Text(
          'password',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.h),
        TextFieldWidget(
          textlabel: 'Password',
          iconData: Icons.password,
          textEditingController: passwordController,
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
        TextButtonWidget(
          text: 'Login',
          onPressed: () async {
            // try {
            //   final credential =
            //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
            //     email: emailAddressController.text,
            //     password: passwordController.text,
            //   );
            //   context.pushNamed(Routes.homeView);
            // } on FirebaseAuthException catch (e) {
            //   if (e.code == 'weak-password') {
            //     log('The password provided is too weak.');
            //   } else if (e.code == 'email-already-in-use') {
            //     log('The account already exists for that email.');
            //   }
            // } catch (e) {
            //   log(e.toString());
            // }
          },
        ),
      ],
    );
  }
}
