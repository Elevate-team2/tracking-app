import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/constants/app_widgets_keys.dart';
import 'package:tracking_app/core/l10n/translations/app_localizations.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/core/responsive/size_provider.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/forget_password_screen.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';

import 'forget_password_screen_test.mocks.dart';

@GenerateMocks([ForgetPasswordBloc])
void main() {
  late MockForgetPasswordBloc mockForgetPasswordBloc;

  setUp(() {
    mockForgetPasswordBloc = MockForgetPasswordBloc();
    when(mockForgetPasswordBloc.state)
        .thenReturn(const ForgetPasswordState());
    when(mockForgetPasswordBloc.stream)
        .thenAnswer((_) => Stream.fromIterable([const ForgetPasswordState()]));

    getIt.registerFactory<ForgetPasswordBloc>(() => mockForgetPasswordBloc);
  });

  tearDown(getIt.reset);

  Widget prepareWidget() {
    return SizeProvider(
      baseSize: const Size(375, 812),
      height: 812,
      width: 375,
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: (settings) {
          if (settings.name == "verifyCodeScreen") {
            return MaterialPageRoute(builder: (_) => const Scaffold());
          }
          return null;
        },
        home: BlocProvider<ForgetPasswordBloc>.value(
          value: mockForgetPasswordBloc,
          child: const ForgetPasswordScreen(),
        ),
      ),
    );
  }

  group("ForgetPasswordScreen Tests", () {
    testWidgets("Verify AppBar exists", (WidgetTester tester) async {
      await tester.pumpWidget(prepareWidget());

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byKey(const Key(AppWidgetsKeys.forgetAppBar)), findsOneWidget);
    });

    testWidgets("Verify Title and Subtitle", (WidgetTester tester) async {
      await tester.pumpWidget(prepareWidget());

      expect(find.byKey(const Key(AppWidgetsKeys.forgetTitle)), findsOneWidget);
      expect(find.byKey(const Key(AppWidgetsKeys.forgetSubtitle)), findsOneWidget);
    });

    testWidgets("Verify Email TextField exists and hint/label", (WidgetTester tester) async {
      await tester.pumpWidget(prepareWidget());

      final emailField = find.byKey(const Key(AppWidgetsKeys.emailTextField));
      expect(emailField, findsOneWidget);
    });

    testWidgets("Verify Confirm Button exists", (WidgetTester tester) async {
      await tester.pumpWidget(prepareWidget());

      final confirmBtn = find.byKey(const Key(AppWidgetsKeys.confirmButton));
      expect(confirmBtn, findsOneWidget);

      expect(find.textContaining("Confirm"), findsOneWidget);
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

      expect(find.byKey(const Key(AppWidgetsKeys.forgetLoading)), findsOneWidget);
      expect(find.byType(LoadingAnimationWidget), findsNothing);
    });

    testWidgets("Verify Success SnackBar", (WidgetTester tester) async {
      when(mockForgetPasswordBloc.state).thenReturn(
        const ForgetPasswordState(
          requestState: RequestState.success,
          info: "Reset link sent",
        ),
      );
      when(mockForgetPasswordBloc.stream).thenAnswer(
            (_) => Stream.fromIterable([
          const ForgetPasswordState(
            requestState: RequestState.success,
            info: "Reset link sent",
          ),
        ]),
      );

      await tester.pumpWidget(prepareWidget());
      await tester.pumpAndSettle();

      expect(find.text("Reset link sent"), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets("Verify Error SnackBar", (WidgetTester tester) async {
      when(mockForgetPasswordBloc.state).thenReturn(
        const ForgetPasswordState(
          requestState: RequestState.error,
          error: "Something went wrong",
        ),
      );
      when(mockForgetPasswordBloc.stream).thenAnswer(
            (_) => Stream.fromIterable([
          const ForgetPasswordState(
            requestState: RequestState.error,
            error: "Something went wrong",
          ),
        ]),
      );

      await tester.pumpWidget(prepareWidget());
      await tester.pumpAndSettle();

      expect(find.text("Something went wrong"), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    //validation test
    testWidgets("Show error when email is empty", (WidgetTester tester) async {
      await tester.pumpWidget(prepareWidget());

      await tester.tap(find.byKey(const Key(AppWidgetsKeys.confirmButton)));
      await tester.pumpAndSettle();

      expect(find.textContaining("Email"), findsWidgets);
      expect(find.textContaining("required"), findsOneWidget);
    });

    testWidgets("Show error when email is invalid", (WidgetTester tester) async {
      await tester.pumpWidget(prepareWidget());

      await tester.enterText(find.byKey(const Key(AppWidgetsKeys.emailTextField)), "invalid-email");
      await tester.tap(find.byKey(const Key(AppWidgetsKeys.confirmButton)));
      await tester.pumpAndSettle();

      expect(find.textContaining("not valid"), findsOneWidget);
    });

    testWidgets("Trigger event when email is valid", (WidgetTester tester) async {
      await tester.pumpWidget(prepareWidget());

      await tester.enterText(find.byKey(const Key(AppWidgetsKeys.emailTextField)), "test@gmail.com");
      await tester.tap(find.byKey(const Key(AppWidgetsKeys.confirmButton)));
      await tester.pumpAndSettle();

      verify(mockForgetPasswordBloc.add(any)).called(1);
    });
  });
}
