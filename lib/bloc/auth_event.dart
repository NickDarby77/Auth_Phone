part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class SendPhoneNumberEvent extends AuthEvent {
  final String phoneNumber;

  SendPhoneNumberEvent({required this.phoneNumber});
}

final class SendReceivedCodeEvent extends AuthEvent {
  final String code;

  SendReceivedCodeEvent({required this.code});
}
