import 'package:dartz/dartz.dart';
import 'package:fire_app/features/register/domain/entities/register_entity.dart';
import 'package:fire_app/features/register/domain/repos/register_repos.dart';

import '../../../../core/errors/failures.dart';

class RegiserUseCase {
  final RegisterRepository repository;

  RegiserUseCase({required this.repository});

  Future<RegisterEntity> call(RegisterEntity params) async {
    return await repository.registerWithEmailAndPassword(
        email: params.email,
        password: params.password,
        username: params.userName);
  }
}
