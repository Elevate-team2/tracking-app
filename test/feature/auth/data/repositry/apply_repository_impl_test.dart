import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/data_source/remote/auth_remote_data_source_impl.dart';
import 'package:tracking_app/feature/auth/data/repositry/apply_repositry_impl.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';

class MockRemoteDataSource extends Mock implements AuthRemoteDataSourceImpl {}

void main() {
  late ApplyRepositoryImpl repository;
  late MockRemoteDataSource mockRemote;

  setUp(() {
    mockRemote = MockRemoteDataSource();
    repository = ApplyRepositoryImpl(mockRemote);
  });

  final fakeBody = {"firstName": "Mahmoud"};
  final fakeDriver = Driver(
    id: "1",
    firstName: "Mahmoud",
    lastName: "Ibrahim",
    phone: "01012345678",
    gender: "male",
    country: "Egypt",
    vehicleType: "Car",
    vehicleNumber: "123",
    vehicleLicense: "file.png",
    nid: "456",
    nidImg: "nid.png",
    role: "driver",
    photo: "photo.png",
    createdAt: DateTime.now().toIso8601String(),
    email: "test@mail.com",
  );

  test("should return success from remote", () async {
    when(() => mockRemote.applyDriver(fakeBody)).thenAnswer(
          (_) async => SuccessResult<(Driver, String)>((fakeDriver, "token123")),
    );

    final result = await repository.applyDriver(fakeBody);

    expect(result.isSuccess, true);
    expect(result.getOrNull()?.$1.firstName, "Mahmoud");
    verify(() => mockRemote.applyDriver(fakeBody)).called(1);
  });

  test("should return failure when remote throws error", () async {
    when(() => mockRemote.applyDriver(fakeBody)).thenAnswer(
          (_) async => FailedResult<(Driver, String)>("Server error"),
    );

    final result = await repository.applyDriver(fakeBody);

    expect(result.isFailure, true);
    expect(result.error, "Server error");
  });
}
