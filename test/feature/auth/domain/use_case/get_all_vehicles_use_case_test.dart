import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/vehicles_entity.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';
import 'package:tracking_app/feature/auth/domain/use_case/get_all_vehicles_use_case.dart';

import 'forget_password_use_case_test.mocks.dart';
@GenerateMocks([AuthRepositry])
void main() {
  late MockAuthRepositry mockAuthRepositry;
  late GetAllVehiclesUseCase getAllVehiclesUseCase;
  setUp((){
    mockAuthRepositry=MockAuthRepositry();
    getAllVehiclesUseCase=GetAllVehiclesUseCase(mockAuthRepositry);
    provideDummy<Result<List<VehicleEntity>>>(FailedResult("Dummy Error"));
  });
  final  successResponse= [
    VehicleEntity(
      type: "Motor Cycle",
      speed: 90,
      id: "676b63c99f3884b3405c149b",
      image: "https://flower.elevateegy.com/uploads/3be99805-65e0-4f05-9e98-4ccfb0b2ca5f-Chopper.png",
      createdAt: DateTime.parse("2024-12-25T01:45:45.397Z").toString(),
      updatedAt: DateTime.parse("2024-12-25T01:45:45.397Z").toString(),
    )
  ];
  test('return SuccessResult when repo success', () async{
    when(mockAuthRepositry.getAllVehicles()).thenAnswer((_)async=>SucessResult(successResponse));
    final result=await getAllVehiclesUseCase.getVehicles();
    expect(result, isA<SucessResult>());
    expect((result as SucessResult).sucessResult, successResponse);
    verify(mockAuthRepositry.getAllVehicles()).called(1);
  });
  test('return FailedResult when repo failed', () async{
    final exception=Exception("Throw Exception");
    when(mockAuthRepositry.getAllVehicles()).
    thenAnswer((_)async=>FailedResult(exception.toString()));
    final result=await getAllVehiclesUseCase.getVehicles();
    expect(result, isA<FailedResult>());
    expect((result as FailedResult).errorMessage,
        exception.toString());
    verify(mockAuthRepositry.getAllVehicles()).called(1);
  });
}