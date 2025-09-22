import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/models/login/request/login_request.dart';
import 'package:tracking_app/feature/auth/api/models/login/response/login_response.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';
import 'package:tracking_app/feature/auth/domain/use_case/login_use_case.dart';

import 'login_use_case_test.mocks.dart';
@GenerateMocks([AuthRepositry])
void main() {
  late MockAuthRepositry mockAuthRepositry;
  late LoginUseCase loginUseCase;
  setUp((){
    mockAuthRepositry=MockAuthRepositry();
    loginUseCase=LoginUseCase(mockAuthRepositry);
    provideDummy<Result<LoginResponse>>(FailedResult("Dummy Error"));
  });
  LoginRequest request=LoginRequest(
      email:"mariammohmed.25720@gmail.com",
      password:"Mariam257@"
  );
  final successResponse=LoginResponse(
      message: "success",
      token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2OGQwNDIyY2RkODkzN2UwNTczZWUwNmMiLCJpYXQiOjE3NTg1NTIyNzF9.PHzemBMcIvQJN2J0NWtzPU5q3JdGq1mXiISTq25qMpY"
  );
test("return ApiSuccessResult when auth repo success", ()async{
when(mockAuthRepositry.login(request)).thenAnswer((_)
async=>SucessResult(successResponse));
final result=await loginUseCase.login(request);
expect(result, isA<Result<LoginResponse>>());
expect((result as SucessResult).sucessResult, successResponse);
verify(mockAuthRepositry.login(request)).called(1);
});
  test("return ApiSuccessResult when auth repo failed", ()async{
    final exception=Exception("throw Exception");

    when(mockAuthRepositry.login(request)).thenAnswer((_)
    async=>FailedResult(exception.toString()));
    final result=await loginUseCase.login(request);
    expect(result, isA<Result<LoginResponse>>());
    expect((result as FailedResult).errorMessage, exception.toString());
    verify(mockAuthRepositry.login(request)).called(1);
  });
}