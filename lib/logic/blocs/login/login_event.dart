// login_event.dart
part of 'login_bloc.dart'; // Only if this file is part of a library

abstract class LoginEvent {}

class LoginWithCredentials extends LoginEvent {
  final String username;
  final String password;

  LoginWithCredentials({required this.username, required this.password});
}
