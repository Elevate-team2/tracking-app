part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordEvent {}

class SubmitEmailEvent extends ForgetPasswordEvent {
  final String email;
  SubmitEmailEvent(this.email);
}

class SubmitCodeEvent extends ForgetPasswordEvent {
  final String code;
  SubmitCodeEvent(this.code);
}

class ResendCodeEvent extends ForgetPasswordEvent {
  final String email;
  ResendCodeEvent(this.email);
}

class StartResendTimerEvent extends ForgetPasswordEvent {}
