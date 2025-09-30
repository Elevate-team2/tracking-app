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
import 'package:tracking_app/core/routes/app_route.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/register_screen.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_states.dart';

import 'register_screen_test.mocks.dart';

@GenerateMocks([ApplyBloc])
void main() {
  late MockApplyBloc mockApplyBloc;

  setUp(() {
    mockApplyBloc = MockApplyBloc();
    when(mockApplyBloc.state).thenReturn(const ApplyStates());
    when(
      mockApplyBloc.stream,
    ).thenAnswer((_) => Stream.fromIterable([const ApplyStates()]));

    getIt.registerFactory<ApplyBloc>(() => mockApplyBloc);
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
        home: BlocProvider<ApplyBloc>.value(
          value: mockApplyBloc,
          child: const ApplyScreen(),
        ),
        routes: {
      AppRoute.loginRoute: (_) => const Scaffold(
            body: Text('Login Screen'),
          ),
    },
      ),
    );
  }

  group("ApplyScreen Tests", () {
    testWidgets("Verify AppBar exists", (tester) async {
      await tester.pumpWidget(prepareWidget());

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byKey(const Key(AppWidgetsKeys.applyScreen)), findsOneWidget);
    });

    testWidgets("Verify TextFields exist", (tester) async {
      await tester.pumpWidget(prepareWidget());

      expect(find.byType(TextFormField), findsWidgets);
      expect(find.text("First legal name"), findsOneWidget);
      expect(find.text("Second legal name"), findsNWidgets(1));
      expect(find.text("Email"), findsOneWidget);
      expect(find.text("Phone number"), findsOneWidget);
    });

    testWidgets("Verify Continue Button exists", (tester) async {
      await tester.pumpWidget(prepareWidget());

      expect(find.text("Continue"), findsOneWidget);
    });

    testWidgets("Show validation error when fields are empty", (tester) async {
      final l10n = await AppLocalizations.delegate.load(const Locale('en'));

      await tester.pumpWidget(prepareWidget());

      await tester.ensureVisible(find.text(l10n.continueBtn));
      await tester.tap(find.text(l10n.continueBtn));
      await tester.pumpAndSettle();

      expect(find.text(l10n.required), findsWidgets);
    });

    testWidgets("Show SnackBar on success", (tester) async {
      final l10n = await AppLocalizations.delegate.load(const Locale('en'));

      when(
        mockApplyBloc.state,
      ).thenReturn(const ApplyStates(applyState: RequestState.success));
      when(mockApplyBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const ApplyStates(applyState: RequestState.success),
        ]),
      );

      await tester.pumpWidget(prepareWidget());
      await tester.pumpAndSettle();
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(l10n.sucessApply), findsOneWidget);
    });
  });
}
