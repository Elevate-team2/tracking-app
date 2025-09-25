import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/feature/auth/domain/use_case/forget_password_use_case.dart';
import 'package:tracking_app/feature/auth/domain/use_case/verify_reset_code_use_case.dart';
import 'package:tracking_app/feature/auth/domain/use_case/reset_password_use_case.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';

import 'forget_password_bloc_test.mocks.dart';

@GenerateMocks([
  ForgetPasswordUseCase,
  VerifyResetCodeUseCase,
  ResetPasswordUseCase,
])
void main() {
  late MockForgetPasswordUseCase mockForgetPasswordUseCase;
  late MockVerifyResetCodeUseCase mockVerifyResetCodeUseCase;
  late MockResetPasswordUseCase mockResetPasswordUseCase;
  late ForgetPasswordBloc forgetPasswordBloc;

  const email = "test@gmail.com";
  const code = "123456";
  const newPassword = "12345678";

  setUp(() {
    provideDummy<Result<String>>(SucessResult<String>("success"));
    mockForgetPasswordUseCase = MockForgetPasswordUseCase();
    mockVerifyResetCodeUseCase = MockVerifyResetCodeUseCase();
    mockResetPasswordUseCase = MockResetPasswordUseCase();
    forgetPasswordBloc = ForgetPasswordBloc(
      mockForgetPasswordUseCase,
      mockVerifyResetCodeUseCase,
      mockResetPasswordUseCase,
    );
  });

  group("SubmitEmailEvent", () {
    blocTest<ForgetPasswordBloc, ForgetPasswordState>(
      "emits [loading, success] when useCase returns SucessResult",
      build: () {
        when(mockForgetPasswordUseCase.call(email)).thenAnswer(
          (_) async => SucessResult<String>("OTP sent to your email"),
        );
        return forgetPasswordBloc;
      },
      act: (bloc) => bloc.add(SubmitEmailEvent(email)),
      expect: () => const [
        ForgetPasswordState(requestState: RequestState.loading),
        ForgetPasswordState(
          requestState: RequestState.success,
          info: "OTP sent to your email",
        ),
      ],
      verify: (_) => verify(mockForgetPasswordUseCase.call(email)).called(1),
    );

    blocTest<ForgetPasswordBloc, ForgetPasswordState>(
      "emits [loading, error] when useCase returns FailedResult",
      build: () {
        when(mockForgetPasswordUseCase.call(email)).thenAnswer(
          (_) async => FailedResult<String>("No account found"),
        );
        return forgetPasswordBloc;
      },
      act: (bloc) => bloc.add(SubmitEmailEvent(email)),
      expect: () => const [
        ForgetPasswordState(requestState: RequestState.loading),
        ForgetPasswordState(
          requestState: RequestState.error,
          error: "No account found",
        ),
      ],
      verify: (_) => verify(mockForgetPasswordUseCase.call(email)).called(1),
    );
  });

  group("SubmitCodeEvent", () {
    blocTest<ForgetPasswordBloc, ForgetPasswordState>(
      "emits [loading, success] when code verification succeeds",
      build: () {
        when(mockVerifyResetCodeUseCase.call(code)).thenAnswer(
          (_) async => SucessResult<String>("Code verified successfully"),
        );
        return forgetPasswordBloc;
      },
      act: (bloc) => bloc.add(SubmitCodeEvent(code)),
      expect: () => const [
        ForgetPasswordState(requestState: RequestState.loading),
        ForgetPasswordState(
          requestState: RequestState.success,
          info: "Code verified successfully",
          isVerifySuccess: true,
        ),
        ForgetPasswordState(
          requestState: RequestState.success,
          info: "Code verified successfully",
          isVerifySuccess: false,
        ),
      ],
      verify: (_) => verify(mockVerifyResetCodeUseCase.call(code)).called(1),
    );

    blocTest<ForgetPasswordBloc, ForgetPasswordState>(
      "emits [loading, error] when code verification fails",
      build: () {
        when(mockVerifyResetCodeUseCase.call(code)).thenAnswer(
          (_) async => FailedResult<String>("Invalid code"),
        );
        return forgetPasswordBloc;
      },
      act: (bloc) => bloc.add(SubmitCodeEvent(code)),
      expect: () => const [
        ForgetPasswordState(requestState: RequestState.loading),
        ForgetPasswordState(
          requestState: RequestState.error,
          error: "Invalid code",
        ),
      ],
      verify: (_) => verify(mockVerifyResetCodeUseCase.call(code)).called(1),
    );
  });

  group("ResendCodeEvent", () {
    // test(
    //   "emits [loading, success, timer states, resend enabled] when resend succeeds",
    //   () {
    //     ...
    //   },
    // );

    blocTest<ForgetPasswordBloc, ForgetPasswordState>(
      "emits [loading, error] when resend fails",
      build: () {
        when(mockForgetPasswordUseCase.call(email)).thenAnswer(
          (_) async => FailedResult<String>("Cannot resend code"),
        );
        return forgetPasswordBloc;
      },
      act: (bloc) => bloc.add(ResendCodeEvent(email)),
      expect: () => const [
        ForgetPasswordState(requestState: RequestState.loading),
        ForgetPasswordState(
          requestState: RequestState.error,
          error: "Cannot resend code",
        ),
      ],
      verify: (_) => verify(mockForgetPasswordUseCase.call(email)).called(1),
    );
  });

  group("ResetPasswordEvent", () {
    blocTest<ForgetPasswordBloc, ForgetPasswordState>(
      "emits [loading, success] when reset succeeds",
      build: () {
        when(mockResetPasswordUseCase.call(email, newPassword)).thenAnswer(
          (_) async => SucessResult<String>("Password reset successfully"),
        );
        return forgetPasswordBloc;
      },
      act: (bloc) => bloc.add(ResetPasswordEvent(email, newPassword)),
      expect: () => const [
        ForgetPasswordState(requestState: RequestState.loading),
        ForgetPasswordState(
          requestState: RequestState.success,
          info: "Password reset successfully",
        ),
      ],
      verify: (_) =>
          verify(mockResetPasswordUseCase.call(email, newPassword)).called(1),
    );

    blocTest<ForgetPasswordBloc, ForgetPasswordState>(
      "emits [loading, error] when reset fails",
      build: () {
        when(mockResetPasswordUseCase.call(email, newPassword)).thenAnswer(
          (_) async => FailedResult<String>("Reset failed"),
        );
        return forgetPasswordBloc;
      },
      act: (bloc) => bloc.add(ResetPasswordEvent(email, newPassword)),
      expect: () => const [
        ForgetPasswordState(requestState: RequestState.loading),
        ForgetPasswordState(
          requestState: RequestState.error,
          error: "Reset failed",
        ),
      ],
      verify: (_) =>
          verify(mockResetPasswordUseCase.call(email, newPassword)).called(1),
    );
  });
}
