import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/constants/app_widgets_keys.dart';
import 'package:tracking_app/core/l10n/translations/app_localizations.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/core/responsive/size_provider.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/reset_password_screen.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';

import 'reset_password_screen_test.mocks.dart';

@GenerateMocks([ForgetPasswordBloc])
void main() {
  late MockForgetPasswordBloc mockForgetPasswordBloc;

  setUp(() {
    mockForgetPasswordBloc = MockForgetPasswordBloc();
    when(mockForgetPasswordBloc.state).thenReturn(const ForgetPasswordState());
    when(
      mockForgetPasswordBloc.stream,
    ).thenAnswer((_) => Stream.fromIterable([const ForgetPasswordState()]));

    getIt.registerFactory<ForgetPasswordBloc>(() => mockForgetPasswordBloc);
  });

  tearDown(getIt.reset);

  Widget prepareWidget({String email = "test@gmail.com"}) {
    return SizeProvider(
      baseSize: const Size(375, 812),
      height: 812,
      width: 375,
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routes: {
        '/login': (context) => const Scaffold(
              body: Center(child: Text('Mock Login Screen')),
            ),
      },
        home: BlocProvider<ForgetPasswordBloc>.value(
          value: mockForgetPasswordBloc,
          child: ResetPasswordScreen(email: email),
        ),
      ),
    );
  }

  group("ResetPasswordScreen Tests", () {
    testWidgets("Verify AppBar exists", (WidgetTester tester) async {
      await tester.pumpWidget(prepareWidget());

      expect(find.byType(AppBar), findsOneWidget);
      expect(
        find.byKey(const Key(AppWidgetsKeys.resetPasswordAppBar)),
        findsOneWidget,
      );
      expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
    });

    testWidgets("Verify Title and Subtitle", (WidgetTester tester) async {
      await tester.pumpWidget(prepareWidget());

      expect(
        find.byKey(const Key(AppWidgetsKeys.resetPasswordTitle)),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key(AppWidgetsKeys.resetPasswordSubtitle)),
        findsOneWidget,
      );
    });

    testWidgets("Verify Password and Confirm Password TextFields exist", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(prepareWidget());

      final newPasswordField = find.byKey(
        const Key(AppWidgetsKeys.newPasswordTextField),
      );
      final confirmPasswordField = find.byKey(
        const Key(AppWidgetsKeys.confirmPasswordTextField),
      );

      expect(newPasswordField, findsOneWidget);
      expect(confirmPasswordField, findsOneWidget);
    });

    testWidgets("Verify Confirm Button exists", (WidgetTester tester) async {
      await tester.pumpWidget(prepareWidget());

      final confirmBtn = find.byKey(
        const Key(AppWidgetsKeys.resetPasswordConfirmButton),
      );
      expect(confirmBtn, findsOneWidget);
    });

    testWidgets("Verify Loading State", (WidgetTester tester) async {
      when(mockForgetPasswordBloc.state).thenReturn(
        const ForgetPasswordState(requestState: RequestState.loading),
      );
      when(mockForgetPasswordBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const ForgetPasswordState(requestState: RequestState.loading),
        ]),
      );

      await tester.pumpWidget(prepareWidget());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(
        find.byKey(const Key(AppWidgetsKeys.resetPasswordConfirmButton)),
        findsNothing,
      );
    });

    testWidgets("Verify Success SnackBar", (WidgetTester tester) async {
      when(mockForgetPasswordBloc.state).thenReturn(
        const ForgetPasswordState(
          requestState: RequestState.success,
          info: "Password reset successfully",
        ),
      );
      when(mockForgetPasswordBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const ForgetPasswordState(
            requestState: RequestState.success,
            info: "Password reset successfully",
          ),
        ]),
      );

      await tester.pumpWidget(prepareWidget());
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets("Verify Error SnackBar", (WidgetTester tester) async {
      when(mockForgetPasswordBloc.state).thenReturn(
        const ForgetPasswordState(
          requestState: RequestState.error,
          error: "Failed to reset password",
        ),
      );
      when(mockForgetPasswordBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const ForgetPasswordState(
            requestState: RequestState.error,
            error: "Failed to reset password",
          ),
        ]),
      );

      await tester.pumpWidget(prepareWidget());
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets("Show error when password fields are empty", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(prepareWidget());

      await tester.tap(
        find.byKey(const Key(AppWidgetsKeys.resetPasswordConfirmButton)),
      );
      await tester.pumpAndSettle();

      expect(find.text("Password is required"), findsOneWidget);
      expect(find.text("this field is required"), findsOneWidget);
    });

    testWidgets("Show error when passwords do not match", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(prepareWidget());

      await tester.enterText(
        find.byKey(const Key(AppWidgetsKeys.newPasswordTextField)),
        "Password123",
      );
      await tester.enterText(
        find.byKey(const Key(AppWidgetsKeys.confirmPasswordTextField)),
        "Different123",
      );
      await tester.tap(
        find.byKey(const Key(AppWidgetsKeys.resetPasswordConfirmButton)),
      );
      await tester.pumpAndSettle();
    });

    testWidgets("Show error when password is invalid", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(prepareWidget());

      await tester.enterText(
        find.byKey(const Key(AppWidgetsKeys.newPasswordTextField)),
        "weak",
      );
      await tester.enterText(
        find.byKey(const Key(AppWidgetsKeys.confirmPasswordTextField)),
        "weak",
      );
      await tester.tap(
        find.byKey(const Key(AppWidgetsKeys.resetPasswordConfirmButton)),
      );
      await tester.pumpAndSettle();

      expect(
        find.text("Password must be at least 6 characters"),
        findsOneWidget,
      ); // Updated
    });

    testWidgets("Trigger ResetPasswordEvent when passwords are valid", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(prepareWidget(email: "test@gmail.com"));

      await tester.enterText(
        find.byKey(const Key(AppWidgetsKeys.newPasswordTextField)),
        "ValidPass123",
      );
      await tester.enterText(
        find.byKey(const Key(AppWidgetsKeys.confirmPasswordTextField)),
        "ValidPass123",
      );
      await tester.tap(
        find.byKey(const Key(AppWidgetsKeys.resetPasswordConfirmButton)),
      );
      await tester.pumpAndSettle();

      verify(
        mockForgetPasswordBloc.add(
          argThat(
            isA<ResetPasswordEvent>()
                .having((e) => e.email, 'email', 'test@gmail.com')
                .having((e) => e.newPassword, 'newPassword', 'ValidPass123'),
          ),
        ),
      ).called(1);
    });
  });
}
