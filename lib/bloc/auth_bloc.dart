import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_phone_auth_app_homework/models/error_model.dart';
import 'package:flutter_phone_auth_app_homework/models/token_model.dart';
import 'package:flutter_phone_auth_app_homework/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<SendPhoneNumberEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final tokenModel =
            await repository.getCode(phoneNumber: event.phoneNumber);
        emit(AuthSuccess(tokenModel: tokenModel));
      } catch (e) {
        if (e is DioException) {
          emit(
            AuthError(
              errorText: e.response!.data['message'].toString(),
            ),
          );
        } else {
          emit(
            AuthError(
              errorText: e.toString(),
            ),
          );
        }
      }
    });

    on<SendReceivedCodeEvent>((event, emit) async {
      emit(AuthLoadingCode());

      try {
        final errorModel = await repository.sendCode(code: event.code);

        emit(AuthSuccessCode(errorModel: errorModel));
      } catch (e) {
        if (e is DioException) {
          if (e.response?.data['error'] != null) {
            emit(AuthErrorCode(
              errorText: e.response!.data['error'].toString(),
            ));
          } else {
            emit(
              AuthErrorCode(
                errorText: e.response!.data['message'].toString(),
              ),
            );
          }
        } else {
          emit(
            AuthErrorCode(
              errorText: e.toString(),
            ),
          );
        }
      }
    });
  }
}
