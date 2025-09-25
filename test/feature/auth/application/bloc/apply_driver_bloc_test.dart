import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';
import 'package:tracking_app/feature/auth/domain/use_case/apply_driver_usecase.dart';
import 'package:tracking_app/feature/auth/presentation/bloc/apply_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/bloc/apply_event.dart';
import 'package:tracking_app/feature/auth/presentation/bloc/apply_state.dart';

// Mock
class MockApplyDriverUseCase extends Mock implements ApplyDriverUseCase {}

void main() {
  late ApplyDriverBloc bloc;
  late MockApplyDriverUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockApplyDriverUseCase();
    bloc = ApplyDriverBloc(mockUseCase);
  });

  tearDown(() {
    bloc.close();
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

  group("ApplyDriverBloc", () {
    test("initial state should be ApplyDriverState.init()", () {
      expect(bloc.state.requestState, RequestState.init);
    });

    blocTest<ApplyDriverBloc, ApplyDriverState>(
      "emits [loading, success] when apply driver succeeds",
      build: () {
        when(() => mockUseCase.call(fakeBody))
            .thenAnswer((_) async => SuccessResult((fakeDriver, "token123")));
        return bloc;
      },
      act: (bloc) => bloc.add(ApplyDriverSubmitted(fakeBody)),
      expect: () => [
        bloc.state.copyWith(requestState: RequestState.loading),
        bloc.state.copyWith(
          requestState: RequestState.success,
          driver: fakeDriver,
          token: "token123",
        ),
      ],
    );

    blocTest<ApplyDriverBloc, ApplyDriverState>(
      "emits [loading, error] when apply driver fails",
      build: () {
        when(() => mockUseCase.call(fakeBody))
            .thenAnswer((_) async => FailedResult("Server error"));
        return bloc;
      },
      act: (bloc) => bloc.add(ApplyDriverSubmitted(fakeBody)),
      expect: () => [
        bloc.state.copyWith(requestState: RequestState.loading),
        bloc.state.copyWith(
          requestState: RequestState.error,
          error: "Server error",
        ),
      ],
    );
  });
}
