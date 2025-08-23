import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        emit(LoginSuccess('User logged in successfully'));
      } else {
        emit(LoginFailure('Failed to login user'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('Wrong password provided for that user.'));
      } else if (e.code == 'invalid-email') {
        emit(LoginFailure('The email address is not valid.'));
      } else if (e.code == 'user-disabled') {
        emit(LoginFailure(
            'The user account has been disabled by an administrator.'));
      } else if (e.code == 'firebase_auth' || e.code == 'invalid-credential') {
        emit(LoginFailure('The credential is malformed or has expired '));
      } else {
        emit(LoginFailure(e.toString()));
        log(e.toString());
      }
    }
  }
}
