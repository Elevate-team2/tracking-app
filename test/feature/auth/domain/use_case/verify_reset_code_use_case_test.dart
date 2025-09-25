import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';
import 'package:tracking_app/feature/auth/domain/use_case/verify_reset_code_use_case.dart';

import 'verify_reset_code_use_case_test.mocks.dart';

@GenerateMocks([AuthRepositry])
void main() {
  late MockAuthRepositry mockAuthRepositry;
  late VerifyResetCodeUseCase verifyResetCodeUseCase;

  setUp(() {
    provideDummy<Result<String>>(SucessResult<String>("success"));
    mockAuthRepositry = MockAuthRepositry();
    verifyResetCodeUseCase = VerifyResetCodeUseCase(mockAuthRepositry);
  });

  group("test verifyResetCode use case", () {
    const code = "123456";

    test("should return SuccessResult when AuthRepositry returns success", () async {
      when(mockAuthRepositry.verifyResetCode(code))
          .thenAnswer((_) async => SucessResult<String>("Code verified successfully"));

      final result = await verifyResetCodeUseCase.call(code);

      expect(result, isA<SucessResult<String>>());
      final success = result as SucessResult<String>;
      expect(success.sucessResult, "Code verified successfully");
      verify(mockAuthRepositry.verifyResetCode(code)).called(1);
      verifyNoMoreInteractions(mockAuthRepositry);
    });

    test("should return FailedResult when AuthRepositry returns failure", () async {
      when(mockAuthRepositry.verifyResetCode(code))
          .thenAnswer((_) async => FailedResult<String>("Invalid reset code"));

      final result = await verifyResetCodeUseCase.call(code);

      expect(result, isA<FailedResult<String>>());
      final error = result as FailedResult<String>;
      expect(error.errorMessage, "Invalid reset code");
      verify(mockAuthRepositry.verifyResetCode(code)).called(1);
      verifyNoMoreInteractions(mockAuthRepositry);
    });
  });
}
