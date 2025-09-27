
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_app/core/l10n/translations/app_localizations.dart';
import 'package:tracking_app/core/responsive/size_provider.dart';
import 'package:tracking_app/feature/onboarding/presentation/pages/onboarding_screen.dart';


void main(){
  testWidgets("verify onboarding structure", (WidgetTester tester)async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
          home: SizeProvider(
            baseSize: const Size(375, 812),
            height: 812,
            width: 375,
            child: Builder(
              builder: (context) {
                return const OnBoarddingScreen();
              },
            ),
      )




    ));
    expect(find.byType(Padding), findsNWidgets(3));
    expect(find.byType(Column), findsOneWidget);
    expect(find.byKey(const Key("image1")), findsOneWidget);
    expect(find.byType(SizedBox), findsNWidgets(5));
    expect( find.byType(Text), findsNWidgets(4));
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(OutlinedButton), findsOneWidget);


    final columnFinder=find.byType(Column);
    expect(columnFinder, findsOneWidget);
  }
  );
}