import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/change_password_bloc.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/change_password_state.dart';
import 'package:tracking_app/feature/profile/presentation/views/screens/change_password.dart';

class MockChangePasswordBloc
    extends Mock implements ChangePasswordBloc {}

void main() {
  testWidgets("renders ChangePasswordScreen with fields and button",
          (WidgetTester tester) async {
        final mockBloc = MockChangePasswordBloc();

        when(() => mockBloc.state).thenReturn(ChangePasswordInitial());

        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<ChangePasswordBloc>.value(
              value: mockBloc,
              child: const ChangePasswordScreen(),
            ),
          ),
        );

        expect(find.text("Current password"), findsOneWidget);
        expect(find.text("New password"), findsOneWidget);
        expect(find.text("Confirm password"), findsOneWidget);

        expect(find.text("Update"), findsOneWidget);
      });
}
