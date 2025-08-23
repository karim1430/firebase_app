part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class Registerloading extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String errorMessage;

  const RegisterFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class RegisterSuccess extends RegisterState {
  final String successMessage;

  const RegisterSuccess(this.successMessage);

  @override
  List<Object> get props => [successMessage];
}
