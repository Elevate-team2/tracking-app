import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_repository.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/profile/domain/use_case/use_case.dart';

import 'change_password_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late ChangePasswordUseCase changePasswordUseCase;
  late MockProfileRepository mockProfileRepository;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    changePasswordUseCase = ChangePasswordUseCase(mockProfileRepository);

    provideDummy<Result<ChangePasswordResponse>>(
      FailedResult<ChangePasswordResponse>("Dummy Error"),
    );
  });

  group("Change Password UseCase Test", () {
    final request = ChangePasswordRequest(
      password: "1234",
      newPassword: "5678",
    );

    final successResponse = ChangePasswordResponse(message: "Password changed");

    test("return SuccessResult when ProfileRepository success", () async {
      when(mockProfileRepository.changePassword(request))
          .thenAnswer((_) async => SucessResult(successResponse));

      final result = await changePasswordUseCase(request);

      expect(result, isA<SucessResult<ChangePasswordResponse>>());
      expect((result as SucessResult).sucessResult.message, "Password changed");
      verify(mockProfileRepository.changePassword(request)).called(1);
    });

    test("return FailedResult when ProfileRepository fails", () async {
      when(mockProfileRepository.changePassword(request))
          .thenAnswer((_) async => FailedResult("Error"));

      final result = await changePasswordUseCase(request);

      expect(result, isA<FailedResult<ChangePasswordResponse>>());
      expect((result as FailedResult).errorMessage, "Error");
      verify(mockProfileRepository.changePassword(request)).called(1);
    });
  });
}
