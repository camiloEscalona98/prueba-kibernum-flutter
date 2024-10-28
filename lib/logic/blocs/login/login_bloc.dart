import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Importa las partes de tu archivo.
part 'login_event.dart';
part 'login_state.dart';

// Importa las partes de tu archivo.

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio _dio;

  LoginBloc(this._dio) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginInProgress());
      try {
        final response = await _dio.post(
          'https://fakestoreapi.com/auth/login',
          data: {
            "username": event.username,
            "password": event.password,
          },
        );

        if (response.statusCode == 200) {
          emit(LoginSuccessful());
        } else {
          emit(LoginFailure(errorMessage: 'Login failed. Please try again.'));
        }
      } catch (e) {
        emit(LoginFailure(errorMessage: 'An error occurred: ${e.toString()}'));
      }
    });
  }
}
