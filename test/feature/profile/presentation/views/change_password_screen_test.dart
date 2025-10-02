import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/change_password_bloc.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/change_password_state.dart';
import 'package:tracking_app/feature/profile/presentation/views/screens/change_password.dart';

// 👇 Mock Bloc
class MockChangePasswordBloc extends Mock implements ChangePasswordBloc {}

void main() {
  late MockChangePasswordBloc mockBloc;

  setUp(() {

    mockBloc = MockChangePasswordBloc();
  });

  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: BlocProvider<ChangePasswordBloc>.value(
        value: mockBloc,
        child: child,
      ),
    );
  }

  testWidgets('renders ChangePasswordScreen with fields and button',
          (tester) async {
        // arrange
        when(() => mockBloc.state).thenReturn(ChangePasswordInitial());

        // act
        await tester.pumpWidget(makeTestableWidget(const ChangePasswordScreen()));

        // assert
        expect(find.text("Current password"), findsOneWidget);
        expect(find.text("New password"), findsOneWidget);
        expect(find.text("Confirm password"), findsOneWidget);
        expect(find.text("Change Password"), findsOneWidget);
      });

  testWidgets('taps button triggers SubmitChangePasswordEvent',
          (tester) async {
        // arrange
        when(() => mockBloc.state).thenReturn(ChangePasswordInitial());
        when(() => mockBloc.add(any())).thenReturn(null);

        await tester.pumpWidget(makeTestableWidget(const ChangePasswordScreen()));

        // act
        await tester.enterText(find.byKey(const Key("current_password_field")), "old123");
        await tester.enterText(find.byKey(const Key("new_password_field")), "new123");
        await tester.enterText(find.byKey(const Key("confirm_password_field")), "new123");
        await tester.tap(find.text("Change Password"));
        await tester.pump();

        // assert
        verify(() => mockBloc.add(any())).called(1);
      });
}
