import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracking_app/core/utils/request_state/request_state.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/register_screen.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_event.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_states.dart';

class MockApplyBloc extends Mock implements ApplyBloc {}

void main() {
  late MockApplyBloc mockBloc;

  setUp(() {
    mockBloc = MockApplyBloc();
  });

  group("ApplyScreen Widget Tests", () {
    testWidgets("should render ApplyScreen correctly", (WidgetTester tester) async {
      when(() => mockBloc.state).thenReturn(const ApplyStates());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ApplyBloc>.value(
            value: mockBloc,
            child: const ApplyScreen(),
          ),
        ),
      );

      expect(find.text("Apply"), findsWidgets);
      expect(find.text('Welcome!!'), findsOneWidget);
    });

    testWidgets("should show loading indicator when state is loading", (WidgetTester tester) async {
      when(() => mockBloc.state).thenReturn(const ApplyStates(applyState: RequestState.loading));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ApplyBloc>.value(
            value: mockBloc,
            child: const ApplyScreen(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets("should show success message when state is success", (WidgetTester tester) async {
      when(() => mockBloc.state).thenReturn(const ApplyStates(applyState: RequestState.success));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ApplyBloc>.value(
            value: mockBloc,
            child: const ApplyScreen(),
          ),
        ),
      );

      expect(find.text("Applied Successfully!"), findsOneWidget);
    });

    testWidgets("should show error message when state is error", (WidgetTester tester) async {
      when(() => mockBloc.state).thenReturn(
        const ApplyStates(applyState: RequestState.error, applyErrorMessage: "Something went wrong"),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ApplyBloc>.value(
            value: mockBloc,
            child: const ApplyScreen(),
          ),
        ),
      );

      expect(find.text("Something went wrong"), findsOneWidget);
    });

    testWidgets("should type into input fields and submit", (WidgetTester tester) async {
      when(() => mockBloc.state).thenReturn(const ApplyStates(applyState: RequestState.init));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ApplyBloc>.value(
            value: mockBloc,
            child: const ApplyScreen(),
          ),
        ),
      );

      final emailField = find.byKey(const Key("emailField"));
      await tester.enterText(emailField, "test@example.com");

      final submitBtn = find.text("Submit");
      await tester.tap(submitBtn);
      await tester.pump();

      verify(() => mockBloc.add(any(that: isA<GetApplyEvent>()))).called(1);
    });

    testWidgets("should show dropdowns when countries and vehicles loaded", (WidgetTester tester) async {
      when(() => mockBloc.state).thenReturn(
        const ApplyStates(
          countriesState: RequestState.success,
          vehiclesState: RequestState.success,
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ApplyBloc>.value(
            value: mockBloc,
            child: const ApplyScreen(),
          ),
        ),
      );

      expect(find.byKey(const Key("countryDropdown")), findsOneWidget);
      expect(find.byKey(const Key("vehicleDropdown")), findsOneWidget);
    });

    testWidgets("should navigate to next screen when apply success", (WidgetTester tester) async {
      when(() => mockBloc.state).thenReturn(const ApplyStates(applyState: RequestState.success));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ApplyBloc>.value(
            value: mockBloc,
            child: const ApplyScreen(),
          ),
          routes: {
            "/next": (_) => const Scaffold(body: Text("Next Screen")),
          },
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text("Next Screen"), findsOneWidget);
    });
  });
}
