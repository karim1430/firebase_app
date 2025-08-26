import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fire_app/core/extensions/navigation_extensions.dart';
import 'package:fire_app/core/utils/awesome_dialog_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/text_button_widget.dart';
import '../../../../../core/utils/text_field_widget.dart';
import '../../manager/cubit/login_cubit.dart';

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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Loading...')),
          );
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          return;
        }
        if (state is LoginSuccess &&
            FirebaseAuth.instance.currentUser!.emailVerified) {
          awesomeDialogCustom(
                  context, 'Success', state.successMessage, DialogType.success)
              .show();
          // context.pushNamed(Routes.homeView);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
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
                  onPressed: () async {
                    final email = emailAddressController.text.trim();

                    if (email.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(email)) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'Please enter a valid email address.',
                      ).show();
                      return;
                    }
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Success',
                        desc:
                            'Password reset email sent. Please check your inbox.',
                      ).show();
                    } catch (e) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: e.toString(),
                      ).show();
                    }
                  },
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
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(emailAddressController.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter a valid email')),
                    );
                    return;
                  }
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    String email = emailAddressController.text.trim();
                    String password = passwordController.text.trim();
                    try {
                      await context
                          .read<LoginCubit>()
                          .loginUser(email: email, password: password);

                      // Get current user after successful login
                      User? user = FirebaseAuth.instance.currentUser;
                      // context.pushNamed(Routes.homeView); // مؤقتا فقط
                      if (user != null) {
                        if (!user.emailVerified) {
                          await user.sendEmailVerification();
                          awesomeDialogCustom(
                            context,
                            'Email Not Verified',
                            'A verification email has been sent to your email address. Please verify your email before logging in.',
                            DialogType.warning,
                          );
                        } else {
                          await context.pushNamed(Routes.homeView);
                        }
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.toString()}')),
                      );
                    }
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                  // Call your login method here
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
