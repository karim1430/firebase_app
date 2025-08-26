import 'dart:developer';
import 'package:fire_app/core/utils/app_shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import 'dart:async';
import '../../../../core/extensions/navigation_extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      context.pushNamed(Routes.onBoardingScreen);
      String token = AppPreferences().getData('token').toString();
      if (token.isNotEmpty &&
          FirebaseAuth.instance.currentUser != null &&
          FirebaseAuth.instance.currentUser?.emailVerified == true) {
        log('token:::::::::::: $token');
        context.pushNamed(Routes.homeView);
      } else {
        context.pushNamed(Routes.onBoardingScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            Text("Splash Screen", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
