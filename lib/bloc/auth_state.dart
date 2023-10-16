part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final TokenModel tokenModel;

  AuthSuccess({required this.tokenModel});
}

final class AuthError extends AuthState {
  final String errorText;

  AuthError({required this.errorText});
}

final class AuthLoadingCode extends AuthState {}

final class AuthSuccessCode extends AuthState {
  final ErrorModel errorModel;

  AuthSuccessCode({required this.errorModel});
}

final class AuthErrorCode extends AuthState {
  final String errorText;

  AuthErrorCode({required this.errorText});
}
