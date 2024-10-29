import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/utils.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio _dio;

  LoginBloc(this._dio) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginInProgress());
      try {
        final response = await _dio.post(
          '${Constants.apiUrl}/auth/login',
          data: {
            "username": event.username,
            "password": event.password,
          },
        );

        if (response.statusCode == 200) {
          final token = response.data['token'];

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);

          emit(LoginSuccessful());
        } else {
          emit(const LoginFailure(
              errorMessage:
                  'Error de inicio de sesión. Por favor, inténtelo de nuevo.'));
        }
      } catch (e) {
        emit(const LoginFailure(
            errorMessage:
                'Error de inicio de sesión. Por favor, inténtelo de nuevo.'));
      }
    });
  }
}
