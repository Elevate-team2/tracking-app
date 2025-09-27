import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracking_app/feature/profile/domain/use_case/use_case.dart';
import 'package:tracking_app/feature/profile/presentation/views/screens/change_password.dart';

class MockChangePasswordUseCase extends Mock implements ChangePasswordUseCase {}

void main() {
  final sl = GetIt.instance;
  late MockChangePasswordUseCase mockUseCase;

  setUp(() {
    sl.reset();
    mockUseCase = MockChangePasswordUseCase();
    sl.registerLazySingleton<ChangePasswordUseCase>(() => mockUseCase);
  });

  testWidgets("renders ChangePasswordScreen with fields and button",
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: ChangePasswordScreen(),
          ),
        );

        expect(find.text("Current password"), findsOneWidget);
        expect(find.text("New password"), findsOneWidget);
        expect(find.text("Confirm new password"), findsOneWidget);
        expect(find.text("Submit"), findsOneWidget);
      });
}
