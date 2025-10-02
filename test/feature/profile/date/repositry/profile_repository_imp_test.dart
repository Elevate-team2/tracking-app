import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/profile/api/data_source/remote/profile_remote_data_source_impl.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import 'package:tracking_app/feature/profile/data/repository/profile_repository_impl.dart';

import 'profile_repository_imp_test.mocks.dart';

@GenerateMocks([ProfileRemoteDataSourceImpl])
void main() {
  late MockProfileRemoteDataSourceImpl mockProfileRemoteDataSourceImpl;
  late ProfileRepositoryImpl profileRepositoryImpl;

  setUp(() {
    mockProfileRemoteDataSourceImpl = MockProfileRemoteDataSourceImpl();
    profileRepositoryImpl = ProfileRepositoryImpl(mockProfileRemoteDataSourceImpl);
  });

  group("Change Password Repository Test", () {
    final ChangePasswordRequest request = ChangePasswordRequest(
      password: "Mari123@",
      newPassword: "Mari123@1",
    );

    final successResponse = ChangePasswordResponse(
      message: "success",
      token: "fake-token",
    );

    test("should return SuccessResult when remote data source returns success",
            () async {
          when(mockProfileRemoteDataSourceImpl.changePassword(request))
              .thenAnswer((_) async => successResponse);

          final result = await profileRepositoryImpl.changePassword(request);

          expect(result, isA<SucessResult<ChangePasswordResponse>>());
          expect((result as SucessResult).sucessResult, successResponse);
          verify(mockProfileRemoteDataSourceImpl.changePassword(request)).called(1);
        });

    test("should return FailedResult when remote data source throws Exception",
            () async {
          when(mockProfileRemoteDataSourceImpl.changePassword(request))
              .thenThrow(Exception("Something went wrong"));

          final result = await profileRepositoryImpl.changePassword(request);

          expect(result, isA<FailedResult<ChangePasswordResponse>>());
          verify(mockProfileRemoteDataSourceImpl.changePassword(request)).called(1);
        });

    test("should return FailedResult on DioException", () async {
      final dioException = DioException(
        requestOptions: RequestOptions(path: ""),
        type: DioExceptionType.connectionTimeout,
      );

      when(mockProfileRemoteDataSourceImpl.changePassword(request))
          .thenThrow(dioException);

      final result = await profileRepositoryImpl.changePassword(request);

      expect(result, isA<FailedResult<ChangePasswordResponse>>());
      expect((result as FailedResult).errorMessage,
          "ServerFailure with Api Server");
      verify(mockProfileRemoteDataSourceImpl.changePassword(request)).called(1);
    });
  });
}
