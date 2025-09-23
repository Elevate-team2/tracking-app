import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/feature/auth/domain/use_case/forget_password_use_case.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';

import 'forget_password_bloc_test.mocks.dart';

@GenerateMocks([ForgetPasswordUseCase])
void main() {
  late MockForgetPasswordUseCase mockForgetPasswordUseCase;
  late ForgetPasswordBloc forgetPasswordBloc;

  setUp(() {
    provideDummy<Result<String>>(SucessResult<String>("success"));
    mockForgetPasswordUseCase = MockForgetPasswordUseCase();
    forgetPasswordBloc = ForgetPasswordBloc((mockForgetPasswordUseCase));
  });

  group("test forget password bloc", () {
    String email = "test@gmail.com";
    test("initial state should be ForgetPasswordState()", () {
      final bloc = ForgetPasswordBloc(mockForgetPasswordUseCase);
      expect(bloc.state, ForgetPasswordState());
    });

    blocTest<ForgetPasswordBloc, ForgetPasswordState>(
      "emits [loading, success] when useCase returns SucessResult",
      build: () {
        when(mockForgetPasswordUseCase.call(email)).thenAnswer(
          (_) async => SucessResult<String>("OTP sent to your email"),
        );
        return forgetPasswordBloc;
      },
      act: (bloc) => bloc.add(SupmitEmailEvent(email)),
      expect: () => [
        ForgetPasswordState(requestState: RequestState.loading),
        ForgetPasswordState(
          requestState: RequestState.success,
          info: "OTP sent to your email",
        ),
      ],
      verify: (_) {
        verify(mockForgetPasswordUseCase.call(email)).called(1);
      },
    );

    blocTest<ForgetPasswordBloc, ForgetPasswordState>(
      "emits [loading, error] when useCase returns FailedResult",
      build: () {
        when(
          mockForgetPasswordUseCase.call(email),
        ).thenAnswer((_) async => FailedResult<String>("No account found"));
        return ForgetPasswordBloc(mockForgetPasswordUseCase);
      },
      act: (bloc) => bloc.add(SupmitEmailEvent(email)),
      expect: () => [
        ForgetPasswordState(requestState: RequestState.loading),
        ForgetPasswordState(
          requestState: RequestState.error,
          error: "No account found",
        ),
      ],
      verify: (_) {
        verify(mockForgetPasswordUseCase.call(email)).called(1);
      },
    );
  });
}
