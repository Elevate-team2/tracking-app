import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';
import 'package:tracking_app/feature/auth/domain/use_case/apply_driver_usecase.dart';

import 'apply_event.dart';
import 'apply_state.dart';

@Injectable()
class ApplyDriverBloc extends Bloc<ApplyDriverEvent, ApplyDriverState> {
  final ApplyDriverUseCase _useCase;

  ApplyDriverBloc(this._useCase) : super(ApplyDriverState()) {
    on<ApplyDriverSubmitted>(_onApplyDriverSubmitted);
  }

  Future<void> _onApplyDriverSubmitted(
      ApplyDriverSubmitted event,
      Emitter<ApplyDriverState> emit,
      ) async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await _useCase.call(event.body);

    print("Result from useCase: $result");

    if (result is SuccessResult<(Driver, String)>) {
      emit(
        state.copyWith(
          requestState: RequestState.success,
          driver: result.data.$1,
          token: result.data.$2,
        ),
      );
    } else if (result is FailedResult) {
      emit(
        state.copyWith(
          requestState: RequestState.error,
          error: "Error",
        ),
      );
    }
  }


}
