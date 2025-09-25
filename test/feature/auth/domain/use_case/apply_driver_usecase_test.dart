import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';
import 'package:tracking_app/feature/auth/domain/use_case/apply_driver_usecase.dart';

class MockApplyRepository extends Mock implements ApplyRepository {}

void main() {
  late ApplyDriverUseCase useCase;
  late MockApplyRepository mockRepository;

  setUp(() {
    mockRepository = MockApplyRepository();
    useCase = ApplyDriverUseCase(mockRepository);
  });

  final fakeBody = {
    "country": "Egypt",
    "firstName": "Mahmoud",
    "lastName": "Ibrahim",
    "vehicleType": "Car",
    "vehicleNumber": "123",
    "vehicleLicense": "file.png",
    "nid": "456",
    "nidImg": "nid.png",
    "email": "test@mail.com",
    "gender": "male",
    "phone": "01012345678",
    "photo": "photo.png",
    "role": "driver",
    "password": "123456",
  };

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

  test("should call repository.applyDriver and return success", () async {
    when(() => mockRepository.applyDriver(fakeBody)).thenAnswer(
          (_) async => SuccessResult<(Driver, String)>((fakeDriver, "token123")),
    );

    final result = await useCase.call(fakeBody);

    expect(result.isSuccess, true);
    expect(result.getOrNull()?.$1, fakeDriver);
    expect(result.getOrNull()?.$2, "token123");

    verify(() => mockRepository.applyDriver(fakeBody)).called(1);
  });

  test("should return failure when repository fails", () async {
    when(() => mockRepository.applyDriver(fakeBody)).thenAnswer(
          (_) async => FailedResult<(Driver, String)>("Network error"),
    );

    final result = await useCase.call(fakeBody);

    expect(result.isFailure, true);
    expect(result.error, "Network error");
  });
}
