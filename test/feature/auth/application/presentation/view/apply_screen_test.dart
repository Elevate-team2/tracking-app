import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/apply_screen.dart';

import 'mock_bloc.dart';

import 'package:tracking_app/feature/auth/presentation/bloc/apply_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/bloc/apply_state.dart';

void main() {
  late MockApplyDriverBloc mockBloc;

  setUp(() {
    mockBloc = MockApplyDriverBloc();
  });

  Widget makeTestable(Widget child) {
    return MaterialApp(
      home: BlocProvider<ApplyDriverBloc>.value(
        value: mockBloc,
        child: child,
      ),
    );
  }

  testWidgets('renders ApplyScreen correctly', (tester) async {
    // Arrange
    when(() => mockBloc.state).thenReturn(
      const ApplyDriverState(requestState: RequestState.init),
    );

    // Act
    await tester.pumpWidget(makeTestable(const ApplyScreen()));

    // Assert
    expect(find.text('Apply'), findsOneWidget);
    expect(find.text('Welcome!!'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
  });

  testWidgets('shows loading when state is loading', (tester) async {
    // Arrange
    when(() => mockBloc.state).thenReturn(
      const ApplyDriverState(requestState: RequestState.loading),
    );

    // Act
    await tester.pumpWidget(makeTestable(const ApplyScreen()));

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows success state after submission', (tester) async {
    // Arrange
    when(() => mockBloc.state).thenReturn(
      const ApplyDriverState(requestState: RequestState.success),
    );

    // Act
    await tester.pumpWidget(makeTestable(const ApplyScreen()));

    // Assert
    expect(find.text('Submitted ✅'), findsOneWidget);
  });

  testWidgets('shows error when state is error', (tester) async {
    // Arrange
    when(() => mockBloc.state).thenReturn(
      const ApplyDriverState(requestState: RequestState.error, error: "Failed"),
    );

    // Act
    await tester.pumpWidget(makeTestable(const ApplyScreen()));

    // Assert
    expect(find.text('Retry'), findsOneWidget);
  });
}
