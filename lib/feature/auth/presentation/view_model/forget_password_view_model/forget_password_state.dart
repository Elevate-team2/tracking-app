import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/request_state/request_state.dart';

class ForgetPasswordState extends Equatable {
  final RequestState requestState;
  final String info;
  final String error;
  final bool isResendEnabled;
  final int secondsRemaining;
  final bool isVerifySuccess;

  const ForgetPasswordState({
    this.requestState = RequestState.init,
    this.info = "",
    this.error = "",
    this.isResendEnabled = true,
    this.secondsRemaining = 60,
    this.isVerifySuccess = false,
  });

  ForgetPasswordState copyWith({
    RequestState? requestState,
    String? info,
    String? error,
    bool? isResendEnabled,
    int? secondsRemaining,
    bool? isVerifySuccess,
  }) {
    return ForgetPasswordState(
      requestState: requestState ?? this.requestState,
      info: info ?? this.info,
      error: error ?? this.error,
      isResendEnabled: isResendEnabled ?? this.isResendEnabled,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      isVerifySuccess: isVerifySuccess ?? this.isVerifySuccess,
    );
  }

  @override
  List<Object?> get props => [requestState, info, error, isResendEnabled, secondsRemaining,isVerifySuccess];
}
