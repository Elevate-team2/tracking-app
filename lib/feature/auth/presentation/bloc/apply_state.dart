import 'package:equatable/equatable.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';
enum RequestState {init,loading,success,error}
class ApplyDriverState extends Equatable {
  final RequestState? requestState;
  final Driver? driver;
  final String? token;
  final String? error;

  const ApplyDriverState({
    this.requestState = RequestState.init,
    this.driver,
    this.token = "",
    this.error = "",
  });

  ApplyDriverState copyWith({
    final RequestState? requestState,
    Driver? driver,
    String? token,
    String? error,
  }) {
    return ApplyDriverState(
      requestState: requestState ?? this.requestState,
      driver: driver ?? this.driver,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [requestState, driver, token, error];
}
