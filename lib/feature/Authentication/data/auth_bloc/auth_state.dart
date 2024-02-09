part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  final String message;

  LoginFailure({
    required this.message,
  });
}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {
  final String messageError;
  RegisterFailure({
    required this.messageError,
  });
}
