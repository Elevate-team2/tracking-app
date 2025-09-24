import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/apply_screen.dart';

void main() {
  testWidgets('ApplyScreen UI test', (WidgetTester tester) async {
    // Arrange: Build ApplyScreen MaterialApp
    await tester.pumpWidget(
      const MaterialApp(
        home: ApplyScreen(),
      ),
    );

    // Act:

    // Assert: AppBar title
    expect(find.text('Apply'), findsOneWidget);

    //  welcome text
    expect(find.text('Welcome!!'), findsOneWidget);

    //  dropdown Country
    expect(find.text('🇪🇬 Egypt'), findsOneWidget);

    //  TextFormField (First legal name)
    expect(find.byType(TextFormField), findsNWidgets(9));

    //  Radio Buttons
    expect(find.text('Female'), findsOneWidget);
    expect(find.text('Male'), findsOneWidget);

    //   Continue
    expect(find.text('Continue'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
  testWidgets('ApplyScreen form interaction test', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: ApplyScreen(),
      ),
    );

    // Act + Assert

    // First legal name
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter first legal name'),
      'Mahmoud',
    );
    expect(find.text('Mahmoud'), findsOneWidget);

    // Second legal name
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter second legal name'),
      'Ibrahim',
    );
    expect(find.text('Ibrahim'), findsOneWidget);

    //  Email
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter your email'),
      'test@example.com',
    );
    expect(find.text('test@example.com'), findsOneWidget);

    //   Phone number
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter phone number'),
      '01012345678',
    );
    expect(find.text('01012345678'), findsOneWidget);

    //   ID number
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter national ID number'),
      '12345678901234',
    );
    expect(find.text('12345678901234'), findsOneWidget);

    //  Dropdown Vehicle type
    await tester.tap(find.text('Car'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Bike').last);
    await tester.pumpAndSettle();
    expect(find.text('Bike'), findsOneWidget);

    //    Continue
    await tester.tap(find.text('Continue'));
    await tester.pump();
    expect(find.text('Continue'), findsOneWidget);
  });
}
