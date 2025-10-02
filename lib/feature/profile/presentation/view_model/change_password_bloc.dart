import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import '../../domain/use_case/use_case.dart';
import 'change_password_event.dart';
import 'change_password_state.dart';

@injectable
class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordBloc(this.changePasswordUseCase) : super(ChangePasswordInitial()) {
    on<SubmitChangePasswordEvent>(_onSubmitChangePassword);
  }

  Future<void> _onSubmitChangePassword(
      SubmitChangePasswordEvent event,
      Emitter<ChangePasswordState> emit,
      ) async {
    emit(ChangePasswordLoading());

    final Result<ChangePasswordResponse> response =
    await changePasswordUseCase.call(event.request);

    if (response is SucessResult<ChangePasswordResponse>) {
      final ChangePasswordResponse data = response.sucessResult;
      emit(ChangePasswordSuccess(

          data.message));
    } else if (response is FailedResult<ChangePasswordResponse>) {
      emit(ChangePasswordFailure(response.errorMessage));
    } else {
      emit(const ChangePasswordFailure('Unknown error'));
    }
  }
}
