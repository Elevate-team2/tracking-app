import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/l10n/translations/app_localizations.dart';
import 'package:tracking_app/feature/home/presentaion/view/page/app_section.dart';
import 'package:tracking_app/feature/home/presentaion/view/page/home_page.dart';
import 'package:tracking_app/feature/home/presentaion/view/page/order_page.dart';
import 'package:tracking_app/feature/home/presentaion/view/page/profile_page.dart';

void main() {
  testWidgets('verify app section structure', (WidgetTester tester) async {
    late BuildContext myContext;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,

        home: Builder(
          builder: (context) {
            myContext = context;

            return const AppSection();
          },
        ),
      ),
    );

    await tester.drag(find.byType(PageView), const Offset(-400, 0));

    await tester.pumpAndSettle();

    expect(find.byType(OrderPage), findsOneWidget);
    expect(find.byType(HomePage), findsNothing);

    await tester.drag(find.byType(PageView), const Offset(-400, 0));

    await tester.pumpAndSettle();

    expect(find.byType(ProfilePage), findsOneWidget);

    expect(find.text(myContext.loc.home), findsOneWidget);
    expect(find.text(myContext.loc.orders), findsOneWidget);
    expect(find.text(myContext.loc.profile), findsOneWidget);
  });

  testWidgets('verify pageView drag', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,

        home:  AppSection(),
      ),
    );
    BottomNavigationBar bottomNavBar;
    PageView pageView;

    await tester.drag(find.byType(PageView), const Offset(-400, 0));
    await tester.pumpAndSettle();

    bottomNavBar = tester.widget<BottomNavigationBar>(
      find.byType(BottomNavigationBar),
    );
    pageView = tester.widget<PageView>(find.byType(PageView));

    expect(find.byType(OrderPage), findsOneWidget);
    expect(find.byType(HomePage), findsNothing);
    expect(bottomNavBar.currentIndex, 1);
    expect(pageView.controller!.page, 1);

    await tester.drag(find.byType(PageView), const Offset(-400, 0));
    await tester.pumpAndSettle();
    bottomNavBar = tester.widget<BottomNavigationBar>(
      find.byType(BottomNavigationBar),
    );
    pageView = tester.widget<PageView>(find.byType(PageView));
    expect(find.byType(ProfilePage), findsOneWidget);
    expect(find.byType(OrderPage), findsNothing);
    expect(bottomNavBar.currentIndex, 2);
    expect(pageView.controller!.page, 2);

    // SCROLL LEFT

    await tester.drag(find.byType(PageView), const Offset(500, 0));
    await tester.pumpAndSettle();
    bottomNavBar = tester.widget<BottomNavigationBar>(
      find.byType(BottomNavigationBar),
    );
    pageView = tester.widget<PageView>(find.byType(PageView));

    expect(find.byType(OrderPage), findsOneWidget);
    expect(find.byType(ProfilePage), findsNothing);
    expect(bottomNavBar.currentIndex, 1);
    expect(pageView.controller!.page, 1);

    await tester.drag(find.byType(PageView), const Offset(500, 0));
    await tester.pumpAndSettle();
    bottomNavBar = tester.widget<BottomNavigationBar>(
      find.byType(BottomNavigationBar),
    );
    pageView = tester.widget<PageView>(find.byType(PageView));

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(OrderPage), findsNothing);
    expect(bottomNavBar.currentIndex, 0);
    expect(pageView.controller!.page, 0);
  });

  testWidgets('verify bottomNavigationBar', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,

        home: AppSection(),
      ),
    );
    BottomNavigationBar bottomNavBar;
    PageView pageView;

    await tester.tap(find.byKey( const Key("nav_orders")));
    await tester.pumpAndSettle();
    bottomNavBar = tester.widget<BottomNavigationBar>(
      find.byType(BottomNavigationBar),
    );
    pageView = tester.widget<PageView>(find.byType(PageView));

    expect(find.byType(OrderPage), findsOneWidget);
    expect(bottomNavBar.currentIndex, 1);
    expect(pageView.controller!.page, 1);

    await tester.tap(find.byKey(const Key("nav_profile")));
    await tester.pumpAndSettle();
    bottomNavBar = tester.widget<BottomNavigationBar>(
      find.byType(BottomNavigationBar),
    );
    pageView = tester.widget<PageView>(find.byType(PageView));
    expect(find.byType(ProfilePage), findsOneWidget);
    expect(bottomNavBar.currentIndex, 2);
    expect(pageView.controller!.page, 2);

    await tester.tap(find.byKey(const Key("nav_home")));
    await tester.pumpAndSettle();
    pageView = tester.widget<PageView>(find.byType(PageView));
    bottomNavBar = tester.widget<BottomNavigationBar>(
      find.byType(BottomNavigationBar),
    );
    expect(find.byType(HomePage), findsOneWidget);
    expect(bottomNavBar.currentIndex, 0);
    expect(pageView.controller!.page, 0);
  });
}
