import 'dart:developer';
import 'package:fire_app/core/extensions/navigation_extensions.dart';
import 'package:fire_app/core/routing/routes.dart';
import 'package:fire_app/features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/text_button_widget.dart';
import '../../../../../core/utils/text_field_widget.dart';

class UserNameEmailAndPasswordWiget extends StatefulWidget {
  const UserNameEmailAndPasswordWiget({
    super.key,
  });
  @override
  State<UserNameEmailAndPasswordWiget> createState() =>
      _UserNameEmailAndPasswordWigetState();
}

class _UserNameEmailAndPasswordWigetState
    extends State<UserNameEmailAndPasswordWiget> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.successMessage)),
          );
          // Navigate to home or show success message
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Loading...')),
          );
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
                'Username',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h),
              TextFieldWidget(
                textlabel: 'username',
                iconData: Icons.person,
                textEditingController: userNameController,
              ),
              SizedBox(height: 20.h),
              Text(
                'Email',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h),
              TextFieldWidget(
                keyboardType: TextInputType.emailAddress,
                textlabel: 'Email',
                iconData: Icons.email,
                textEditingController: emailAddressController,
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
                textEditingController: passwordController,
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
                textEditingController: confirmPasswordController,
              ),
              SizedBox(height: 30.h),
              TextButtonWidget(
                  text: 'Register',
                  onPressed: () async {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Passwords do not match')),
                      );
                      return;
                    }
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
                      context.read<RegisterCubit>().registerUser(
                            email: emailAddressController.text,
                            password: passwordController.text,
                            username: userNameController.text,
                          );
                      context.pushNamed(Routes.homeView);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  }),
            ],
          ),
        );
      },
    );
  }
}
