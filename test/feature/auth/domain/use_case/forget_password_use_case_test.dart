import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';
import 'package:tracking_app/feature/auth/domain/use_case/forget_password_use_case.dart';

import 'forget_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepositry])
void main() {
  late MockAuthRepositry mockAuthRepositry;
  late ForgetPasswordUseCase forgetPasswordUseCase;

  setUp(() {
    provideDummy<Result<String>>(SucessResult<String>("success"));
    mockAuthRepositry = MockAuthRepositry();
    forgetPasswordUseCase = ForgetPasswordUseCase(mockAuthRepositry);
  });

  group("test forget password use case", () {
    String email = "test@gmail.com";
    test(
      "should return SuccessResult when AuthRepositry SucessResult",
      () async {
        // arrange
        when(mockAuthRepositry.forgetPassword(email)).thenAnswer(
          (_) async => SucessResult<String>("OTP sent to your email"),
        );

        // act
        final result = await forgetPasswordUseCase.call(email);

        // assert
        expect(result, isA<SucessResult<String>>());
        final success = result as SucessResult<String>;
        expect(success.sucessResult, "OTP sent to your email");
        verify(mockAuthRepositry.forgetPassword(email)).called(1);
        verifyNoMoreInteractions(mockAuthRepositry);
      },
    );

    test(
      "should return AuthRepositry when AuthRepositry AuthRepositry",
      () async {
        // arrange
        when(
          mockAuthRepositry.forgetPassword(email),
        ).thenAnswer((_) async => FailedResult<String>("Server error"));

        // act
        final result = await forgetPasswordUseCase.call(email);

        // assert
        expect(result, isA<FailedResult<String>>());
        final error = result as FailedResult<String>;
        expect(error.errorMessage, "Server error");
        verify(mockAuthRepositry.forgetPassword(email)).called(1);
        verifyNoMoreInteractions(mockAuthRepositry);
      },
    );
  });
}
