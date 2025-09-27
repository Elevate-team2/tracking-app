import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_app/core/constants/app_widgets_keys.dart';
import 'package:tracking_app/core/constants/constants.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/l10n/translations/app_localizations.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/responsive/size_provider.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/approve_screen.dart';

void main() {
  testWidgets('verify approve structure', (WidgetTester tester) async {
    late BuildContext myContext;
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
              myContext = context;
              return const ApproveScreen();
            },
          ),
        ),
      ),
    );

    expect(find.byKey(const Key("stack1")), findsOneWidget);
    expect(find.byKey(const Key(AppWidgetsKeys.ceenterKey1)), findsOneWidget);
    expect(find.byKey(const Key(AppWidgetsKeys.alignKey1)), findsOneWidget);
    expect(find.byType(Padding), findsNWidgets(2));
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(SizedBox), findsNWidgets(7));
    expect(find.byType(Text), findsNWidgets(3));
    expect(find.byType(ElevatedButton), findsNWidgets(1));

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.data == myContext.loc.login &&
            widget.style!.color == AppColors.white &&
            widget.style!.fontSize == myContext.setSp(FontSize.s16) &&
            widget.style!.fontWeight == FontWeight.w400,
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate((widget) {
        if (widget is ElevatedButton && widget.child is Text) {
          return true;
        }
        return false;
      }),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is SizedBox &&
            widget.width == double.infinity &&
            widget.child is ElevatedButton,
      ),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.data == myContext.loc.thankYou &&
            widget.style!.color == AppColors.black &&
            widget.style!.fontWeight == FontWeight.w400 &&
            widget.textAlign == TextAlign.center,
      ),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate((widget) {
        if (widget is SizedBox && widget.child is Text) {
          final child = widget.child as Text;
          return child.data == myContext.loc.thankYou;
        }
        return false;
      }),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate((widget) {
        if (widget is SizedBox && widget.child is Text) {
          final child = widget.child as Text;
          return child.data == myContext.loc.submitted;
        }
        return false;
      }),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.data == myContext.loc.submitted &&
            widget.style!.color == AppColors.black &&
            // widget.style!.fontSize == myContext.setSp(FontSize.s20) &&
            widget.style!.fontWeight == FontWeight.w700 &&
            widget.textAlign == TextAlign.center,
      ),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Icon &&
            widget.icon == Icons.check_circle_outline_rounded &&
            // widget.size==myContext.setWidth(140)&&
            widget.color == AppColors.pink,
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Center &&
            widget.key == const Key(AppWidgetsKeys.ceenterKey1)&&
            // widget.size==myContext.setWidth(140)&&
            widget.child is Padding,
      ),
      findsOneWidget,
    );

    final columnFinder = find.byType(Column);
    expect(columnFinder, findsOneWidget);

    final columnWidget = tester.widget<Column>(columnFinder);

    expect(columnWidget.children.length, 7);

    final firstChild = columnWidget.children[0];
    expect(firstChild, isA<Icon>());

    final secondChild = columnWidget.children[1];
    expect(secondChild, isA<SizedBox>());
    final thirdChild = columnWidget.children[2];
    expect(thirdChild, isA<SizedBox>());
    final child4 = columnWidget.children[3];
    expect(child4, isA<SizedBox>());
    final child5 = columnWidget.children[4];
    expect(child5, isA<SizedBox>());
    final child6 = columnWidget.children[5];
    expect(child6, isA<SizedBox>());
    final child7 = columnWidget.children[6];
    expect(child7, isA<SizedBox>());

    expect(columnWidget.mainAxisSize, MainAxisSize.min);




    final alignFinder = find.byKey(const Key(AppWidgetsKeys.alignKey1));
  expect(alignFinder, findsOneWidget);


  final alignWidget = tester.widget<Align>(alignFinder);


  expect(alignWidget.alignment, Alignment.bottomCenter);


  expect(alignWidget.child, isA<Image>());

  final imageWidget = alignWidget.child as Image;

 
  expect(imageWidget.width, double.infinity);
  expect(imageWidget.fit, BoxFit.cover);
  expect(imageWidget.image, isA<AssetImage>());

  final assetImage = imageWidget.image as AssetImage;
  expect(assetImage.assetName, Constants.approveImageUrl);



  });
}
