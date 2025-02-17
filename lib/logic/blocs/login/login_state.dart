part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginSuccessful extends LoginState {}

class LoginFailure extends LoginState {
  final String errorMessage;
  const LoginFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
