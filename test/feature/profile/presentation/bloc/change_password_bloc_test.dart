import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import 'package:tracking_app/feature/profile/domain/use_case/use_case.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/change_password_bloc.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/change_password_event.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/change_password_state.dart';

import 'change_password_bloc_test.mocks.dart';

@GenerateMocks([ChangePasswordUseCase])
void main() {
  late MockChangePasswordUseCase mockUseCase;
  late ChangePasswordBloc changePasswordBloc;

  setUp(() {
    mockUseCase = MockChangePasswordUseCase();
    changePasswordBloc = ChangePasswordBloc(mockUseCase);

    provideDummy<Result<ChangePasswordResponse>>(
      FailedResult<ChangePasswordResponse>("dummy error"),
    );
  });

  final request = ChangePasswordRequest(
    password: "old123",
    newPassword: "new123",
  );

  final successResponse = ChangePasswordResponse(message: "Password changed");

  group("ChangePasswordBloc", () {
    blocTest<ChangePasswordBloc, ChangePasswordState>(
      "emits [Loading, Success] when useCase returns SuccessResult",
      build: () {
        when(mockUseCase.call(request))
            .thenAnswer((_) async => SucessResult(successResponse));
        return changePasswordBloc;
      },
      act: (bloc) => bloc.add(SubmitChangePasswordEvent(request)),
      expect: () => [
        ChangePasswordLoading(),
        const ChangePasswordSuccess("Password changed"),
      ],
      verify: (_) {
        verify(mockUseCase.call(request)).called(1);
      },
    );

    blocTest<ChangePasswordBloc, ChangePasswordState>(
      "emits [Loading, Failure] when useCase returns FailedResult",
      build: () {
        when(mockUseCase.call(request))
            .thenAnswer((_) async => FailedResult("Error occurred"));
        return changePasswordBloc;
      },
      act: (bloc) => bloc.add(SubmitChangePasswordEvent(request)),
      expect: () => [
        ChangePasswordLoading(),
        const ChangePasswordFailure("Error occurred"),
      ],
      verify: (_) {
        verify(mockUseCase.call(request)).called(1);
      },
    );
  });
}
