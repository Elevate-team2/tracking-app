import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/feature/auth/domain/use_case/forget_password_use_case.dart';
import 'package:tracking_app/feature/auth/domain/use_case/reset_password_use_case.dart';
import 'package:tracking_app/feature/auth/domain/use_case/verify_reset_code_use_case.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';

part 'forget_password_event.dart';

@Injectable()
class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  Timer? _resendTimer;

  ForgetPasswordBloc(this._forgetPasswordUseCase, this._verifyResetCodeUseCase, this._resetPasswordUseCase)
      : super(const ForgetPasswordState()) {
    on<SubmitEmailEvent>(_onSubmitEmail);
    on<SubmitCodeEvent>(_onSubmitCode);
    on<ResendCodeEvent>(_onResendCode);
    on<StartResendTimerEvent>(_onStartResendTimer);
    on<ResetPasswordEvent>(_onResetPasswordEvent);
  }

  Future<void> _onSubmitEmail(SubmitEmailEvent event, Emitter<ForgetPasswordState> emit) async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await _forgetPasswordUseCase.call(event.email);

    switch (result) {
      case SucessResult<String>():
        emit(state.copyWith(
          requestState: RequestState.success,
          info: result.sucessResult,
        ));
      case FailedResult<String>():
        emit(state.copyWith(
          requestState: RequestState.error,
          error: result.errorMessage,
        ));
    }
  }


  Future<void> _onSubmitCode(
      SubmitCodeEvent event,
      Emitter<ForgetPasswordState> emit,
      ) async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await _verifyResetCodeUseCase.call(event.code);

    switch (result) {
      case SucessResult<String>():
        emit(state.copyWith(
          requestState: RequestState.success,
          info: result.sucessResult,
          isVerifySuccess: true,
        ));
        //to build only one time
        emit(state.copyWith(isVerifySuccess: false));
      case FailedResult<String>():
        emit(state.copyWith(
          requestState: RequestState.error,
          error: result.errorMessage,
        ));
    }
  }

  Future<void> _onResendCode(
      ResendCodeEvent event,
      Emitter<ForgetPasswordState> emit,
      ) async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await _forgetPasswordUseCase.call(event.email);

    switch (result) {
      case SucessResult<String>():
        emit(state.copyWith(
          requestState: RequestState.success,
          info: result.sucessResult,
          isVerifySuccess: false,
        ));
        add(StartResendTimerEvent());

      case FailedResult<String>():
        emit(state.copyWith(
          requestState: RequestState.error,
          error: result.errorMessage,
        ));
    }
  }


  void _onStartResendTimer(
      StartResendTimerEvent event, Emitter<ForgetPasswordState> emit) async {
    int seconds = 60;
    emit(state.copyWith(isResendEnabled: false, secondsRemaining: seconds));

    while (seconds > 0) {
      await Future.delayed(const Duration(seconds: 1));

      seconds--;

      //ensure bloc is still opened
      if (!emit.isDone) {
        emit(state.copyWith(secondsRemaining: seconds));
      }
    }

    if (!emit.isDone) {
      emit(state.copyWith(isResendEnabled: true, secondsRemaining: 0));
    }
  }

  @override
  Future<void> close() {
    _resendTimer?.cancel();
    return super.close();
  }

  void _onResetPasswordEvent(
      ResetPasswordEvent event, Emitter<ForgetPasswordState> emit) async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result=await _resetPasswordUseCase.call(event.email, event.newPassword);

    switch(result){
      case SucessResult<String>():
        emit(state.copyWith(
          requestState: RequestState.success,
          info: result.sucessResult,
        ));
      case FailedResult<String>():
       emit(state.copyWith(
           requestState: RequestState.error,
         error: result.errorMessage
       ));
    }
  }

}

