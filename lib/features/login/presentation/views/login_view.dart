import 'package:fire_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:fire_app/features/login/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: LoginViewBody(),
      ),
    );
  }
}
