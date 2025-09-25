import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';
import 'package:tracking_app/feature/auth/domain/use_case/reset_password_use_case.dart';

import 'reset_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepositry])
void main() {
  late MockAuthRepositry mockAuthRepositry;
  late ResetPasswordUseCase resetPasswordUseCase;

  setUp(() {
    provideDummy<Result<String>>(SucessResult<String>("success"));
    mockAuthRepositry = MockAuthRepositry();
    resetPasswordUseCase = ResetPasswordUseCase(mockAuthRepositry);
  });

  group("test resetPassword use case", () {
    const email = "test@gmail.com";
    const newPassword = "12345678";

    test("should return SuccessResult when AuthRepositry returns success", () async {
      when(mockAuthRepositry.resetPassword(email, newPassword))
          .thenAnswer((_) async => SucessResult<String>("Password reset successfully"));

      final result = await resetPasswordUseCase.call(email, newPassword);

      expect(result, isA<SucessResult<String>>());
      final success = result as SucessResult<String>;
      expect(success.sucessResult, "Password reset successfully");
      verify(mockAuthRepositry.resetPassword(email, newPassword)).called(1);
      verifyNoMoreInteractions(mockAuthRepositry);
    });

    test("should return FailedResult when AuthRepositry returns failure", () async {
      when(mockAuthRepositry.resetPassword(email, newPassword))
          .thenAnswer((_) async => FailedResult<String>("Invalid request"));

      final result = await resetPasswordUseCase.call(email, newPassword);

      expect(result, isA<FailedResult<String>>());
      final error = result as FailedResult<String>;
      expect(error.errorMessage, "Invalid request");
      verify(mockAuthRepositry.resetPassword(email, newPassword)).called(1);
      verifyNoMoreInteractions(mockAuthRepositry);
    });
  });
}
