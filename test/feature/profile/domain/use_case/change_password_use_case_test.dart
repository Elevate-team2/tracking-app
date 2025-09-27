import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_repository.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/profile/domain/use_case/use_case.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late MockProfileRepository repository;
  late ChangePasswordUseCase useCase;

  setUp(() {
    repository = MockProfileRepository();
    useCase = ChangePasswordUseCase(repository);
  });

  test("should return success when repo succeed", () async {
    final request =
    ChangePasswordRequest(password: "1234", newPassword: "5678");

    final response = ChangePasswordResponse(message: "Password changed");

    when(() => repository.changePassword(request)).thenAnswer(
          (_) async => SucessResult(response),
    );

    final result = await useCase(request);

    expect(result, isA<SucessResult<ChangePasswordResponse>>());
    expect((result as SucessResult).sucessResult.message, "Password changed");
    verify(() => repository.changePassword(request)).called(1);
  });

  test("should return failure when repo fails", () async {
    final request =
    ChangePasswordRequest(password: "1234", newPassword: "5678");

    when(() => repository.changePassword(request)).thenAnswer(
          (_) async => FailedResult("Error"),
    );

    final result = await useCase(request);

    expect(result, isA<FailedResult>());
    expect((result as FailedResult).errorMessage, "Error");
  });
}
