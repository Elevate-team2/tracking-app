import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

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
    try {
      final response = await changePasswordUseCase(event.request);
      emit(ChangePasswordSuccess(response.message));
    } catch (e) {
      emit(ChangePasswordFailure(e.toString()));
    }
  }
}
