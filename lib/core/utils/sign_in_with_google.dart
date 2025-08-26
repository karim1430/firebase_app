import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential?> signInWithGoogle() async {
  final googleSignIn = GoogleSignIn.instance;
  await googleSignIn.initialize();

  // خطوة المصادقة (authentication)
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
  final scopes = <String>[];
  final GoogleSignInClientAuthorization? authorization =
      await googleUser.authorizationClient.authorizationForScopes(scopes);
  final accessToken = authorization?.accessToken;

  final credential = GoogleAuthProvider.credential(
    idToken: idToken,
    accessToken: accessToken,
  );

  return await FirebaseAuth.instance.signInWithCredential(credential);
}
