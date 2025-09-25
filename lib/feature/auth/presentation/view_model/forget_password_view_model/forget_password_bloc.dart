import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/feature/auth/domain/use_case/forget_password_use_case.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';

part 'forget_password_event.dart';

@Injectable()
class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ForgetPasswordUseCase _useCase;
  ForgetPasswordBloc(this._useCase) : super(const ForgetPasswordState()) {
    on<SupmitEmailEvent>(_onSupmiEmail);
  }
  Future<void> _onSupmiEmail(
    SupmitEmailEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await _useCase.call(event.email);

    switch (result) {
      case SucessResult<String>():
        emit(
          state.copyWith(
            requestState: RequestState.success,
            info: result.sucessResult,
          ),
        );
      case FailedResult<String>():
        emit(
          state.copyWith(
            requestState: RequestState.error,
            error: result.errorMessage,
          ),
        );
    }
  }
}
