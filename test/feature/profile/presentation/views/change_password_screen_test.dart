import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import 'package:tracking_app/feature/profile/domain/use_case/use_case.dart';
import 'package:tracking_app/feature/profile/presentation/views/screens/change_password.dart';

class MockChangePasswordUseCase extends Mock implements ChangePasswordUseCase {}

void main() {
  final sl = GetIt.instance;
  late MockChangePasswordUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockChangePasswordUseCase();

    sl.reset();

    sl.registerLazySingleton<ChangePasswordUseCase>(() => mockUseCase);
  });

  testWidgets('renders ChangePasswordScreen with fields and button', (tester) async {
    when(() => mockUseCase.call(any())).thenAnswer(
          (_) async => SucessResult(ChangePasswordResponse(message: "Password changed")),
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: ChangePasswordScreen(),
      ),
    );

    expect(find.text("Current password"), findsOneWidget);
    expect(find.text("New password"), findsOneWidget);
    expect(find.text("Confirm new password"), findsOneWidget);
    expect(find.text("Change Password"), findsOneWidget);
  });
}
