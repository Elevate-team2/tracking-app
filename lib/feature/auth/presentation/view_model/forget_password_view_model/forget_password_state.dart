import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/request_state/request_state.dart';

class ForgetPasswordState extends Equatable {
  final RequestState? requestState;
  final String? info;
  final String? error;

  const ForgetPasswordState({
    this.requestState = RequestState.init,
    this.info = "",
    this.error = "",
  });

  ForgetPasswordState copyWith({
    final RequestState? requestState,
    String? info,
    String? error,
  }) {
    return ForgetPasswordState(
      requestState: requestState ?? this.requestState,
      error: error ?? this.error,
      info: info ?? this.info,
    );
  }

  @override
  List<Object?> get props =>[requestState,info,error];
}
