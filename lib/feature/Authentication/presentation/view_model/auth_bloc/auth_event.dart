part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent({
    required this.email,
    required this.password,
  });
}

class RegisterEvent extends AuthEvent {
  final String username;

  final String phoneNumber;
  final String email;
  final String password;
  RegisterEvent({
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });
}

class ResetEvent extends AuthEvent {
  final String email;
  ResetEvent({
    required this.email,
  });
}

class GoogleSignEvent extends AuthEvent {}
