import 'package:fire_app/features/register/domain/entities/register_entity.dart';

class RegiserModel extends RegisterEntity {
  RegiserModel(
      {required String username,
      required String email,
      required String password})
      : super(userName: username, email: email, password: password);

  factory RegiserModel.fromFirebaseUser(RegisterEntity user) {
    return RegiserModel(
      username: user.userName,
      email: user.email,
      password: user.password,
    );
  }
}
