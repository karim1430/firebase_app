import 'package:fire_app/features/register/domain/entities/register_entity.dart';

abstract class RegisterRepository {
  Future<RegisterEntity> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  });

  Future<void> registerWithGoogle();

  Future<void> registerWithApple();

  Future<bool> isEmailAlreadyInUse(String email);
}
