import 'dart:developer';

import 'package:fire_app/core/utils/awesome_dialog_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential?> signInWithGoogle() async {
  final googleSignIn = GoogleSignIn.instance;
  await googleSignIn.initialize(
    serverClientId:
        '869953994229-eltkdugv5hvfanm0q1s9mf2inah7toq6.apps.googleusercontent.com',
  );

  // خطوة المصادقة (authentication)
  try {
    final GoogleSignInAccount? googleUser =
        await googleSignIn.authenticate(); // تفاعل مع المستخدم
    if (googleUser == null) {
      return null; // المستخدم لغى تسجيل الدخول
    }

    final auth = googleUser.authentication;
    final idToken = auth.idToken;
    if (idToken == null) {
      throw Exception('Failed to get idToken during authentication');
    }

    // خطوة التفويض (authorization) للحصول على accessToken إذا احتاجته
    // إذا لم تكن بحاجة إليه (مثلاً فقط لـ Firebase Auth) يمكنك تجاوز هذه الخطوة
    final scopes = ['email', 'profile'];
    final GoogleSignInClientAuthorization? authorization =
        await googleUser.authorizationClient.authorizationForScopes(scopes);
    final accessToken = authorization?.accessToken;

    final credential = GoogleAuthProvider.credential(
      idToken: idToken,
      accessToken: accessToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  } on Exception catch (e) {
    log(e.toString());
    return null;
  }
}
