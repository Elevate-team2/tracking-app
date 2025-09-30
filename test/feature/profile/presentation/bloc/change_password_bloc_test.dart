import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import 'package:tracking_app/feature/profile/domain/use_case/use_case.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/change_password_bloc.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/change_password_event.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/change_password_state.dart';

class MockChangePasswordUseCase extends Mock implements ChangePasswordUseCase {}

void main() {
  late MockChangePasswordUseCase mockUseCase;
  late ChangePasswordBloc bloc;

  setUp(() {
    mockUseCase = MockChangePasswordUseCase();
    bloc = ChangePasswordBloc(mockUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  final request = ChangePasswordRequest(
    password: "old123",
    newPassword: "new123",
  );

  final successResponse = ChangePasswordResponse(message: "Password changed");

  blocTest<ChangePasswordBloc, ChangePasswordState>(
    'emits [Loading, Success] when changePasswordUseCase returns SucessResult',
    build: () {
      when(() => mockUseCase.call(request))
          .thenAnswer((_) async => SucessResult(successResponse));
      return bloc;
    },
    act: (bloc) => bloc.add(SubmitChangePasswordEvent(request)),
    expect: () => [
      ChangePasswordLoading(),
      ChangePasswordSuccess("Password changed"),
    ],
    verify: (_) {
      verify(() => mockUseCase.call(request)).called(1);
    },
  );

  blocTest<ChangePasswordBloc, ChangePasswordState>(
    'emits [Loading, Failure] when changePasswordUseCase returns FailedResult',
    build: () {
      when(() => mockUseCase.call(request))
          .thenAnswer((_) async => FailedResult("Error occurred"));
      return bloc;
    },
    act: (bloc) => bloc.add(SubmitChangePasswordEvent(request)),
    expect: () => [
      ChangePasswordLoading(),
      ChangePasswordFailure("Error occurred"),
    ],
    verify: (_) {
      verify(() => mockUseCase.call(request)).called(1);
    },
  );
}
