import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void registerUser({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(Registerloading());
    // await Future.delayed(const Duration(seconds: 2));
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        emit(RegisterSuccess('User registered successfully'));
      } else {
        emit(RegisterFailure('Failed to register user'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure('The account already exists for that email.'));
      }
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
