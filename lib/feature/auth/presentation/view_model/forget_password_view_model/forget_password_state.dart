import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/request_state/request_state.dart';

class ForgetPasswordState extends Equatable {
  final RequestState requestState;
  final String info;
  final String error;
  final bool isResendEnabled;
  final int secondsRemaining;
  final bool showSnackBar;

  const ForgetPasswordState({
    this.requestState = RequestState.init,
    this.info = "",
    this.error = "",
    this.isResendEnabled = true,
    this.secondsRemaining = 60,
    this.showSnackBar = false,
  });

  ForgetPasswordState copyWith({
    RequestState? requestState,
    String? info,
    String? error,
    bool? isResendEnabled,
    int? secondsRemaining,
    bool? showSnackBar,
  }) {
    return ForgetPasswordState(
      requestState: requestState ?? this.requestState,
      info: info ?? this.info,
      error: error ?? this.error,
      isResendEnabled: isResendEnabled ?? this.isResendEnabled,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      showSnackBar: showSnackBar ?? this.showSnackBar,
    );
  }

  @override
  List<Object?> get props => [requestState, info, error, isResendEnabled, secondsRemaining, showSnackBar];
}
