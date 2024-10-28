import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool loading;
  final String error;
  final String? token;

  const LoginState({
    this.loading = false,
    this.error = '',
    this.token,
  });

  LoginState copyWith({
    bool? loading,
    String? error,
    String? token,
  }) =>
      LoginState(
        loading: loading ?? this.loading,
        error: error ?? this.error,
        token: token ?? this.token,
      );

  @override
  List<Object?> get props => [loading, error, token];
}
